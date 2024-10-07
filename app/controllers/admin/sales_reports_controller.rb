module Admin
  class SalesReportsController < Admin::ApplicationController
    require 'caxlsx'

    def index
      @result = result
      @total_sales = total_sales

      render "admin/sales_report/index"
    end

    def download_excel
      # Create a new Excel package
      p = Axlsx::Package.new
      wb = p.workbook

      # Add a worksheet
      wb.add_worksheet(name: "Canteen Sales #{month.strftime('%m-%Y')}") do |sheet|
        header_style = wb.styles.add_style(
          bg_color: '02992a',
          fg_color: 'FFFFFF',
          b: true,
          alignment: {
            horizontal: :center,
            vertical: :center
          }
        )

        column_header_styles = wb.styles.add_style(
          bg_color: 'f0f799',
          fg_color: '000000',
          b: true,
          alignment: {
            horizontal: :center,
            vertical: :center
          }
        )

        cell_rows = ('A'..'Z').to_a

        sheet.add_row ['Sales Report'], style: header_style
        sheet.merge_cells("A1:#{cell_rows[result.columns.length - 1]}1")

        # Add the headers
        sheet.add_row result.columns, style: column_header_styles

        result_array = result.to_a
        total = result.last
        result_array.pop

        # Add data rows
        result_array.each do |data|
          sheet.add_row data.values, style: wb.styles.add_style(
            alignment: {
              horizontal: :center,
              vertical: :center
            }
          )
        end

        sheet.add_row total.values, style: column_header_styles
      end

      # Send the Excel file as a response
      file_name = "sales_report_#{month.strftime('%Y%m%d')}.xlsx"
      send_data p.to_stream.read, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        filename: file_name
    end

    private

    def month
      if params[:month]
        Date.parse("#{params[:month]}-01")
      else
        Date.today.beginning_of_month
      end
    end

    def result
      sales_categories = SalesCategory.pluck(:name)

      category_columns_sql = ''

      sales_categories.each do |category|
        category_columns_sql+="SUM(CASE WHEN sc.name = '#{category}' THEN ds.amount ELSE 0 END) AS \"#{category}\",\n"
      end

      report_sql = "
        SELECT
            COALESCE(TO_CHAR(DATE(ds.sales_date), 'FMDay, FMMonth DD, YYYY'), 'Total') AS \"Date\",
            #{category_columns_sql}
            SUM(ds.amount) AS \"Total Canteen Income\",
            COALESCE(SUM(DISTINCT(rp.total_rental_payments)), 0) AS \"Kiosk Income\",
            SUM(ds.amount) + COALESCE(SUM(DISTINCT(rp.total_rental_payments)), 0) AS \"Total Income\"
        FROM
            daily_sales ds
        JOIN
            sales_categories sc ON ds.sales_category_id = sc.id
        LEFT JOIN (
          SELECT
            DATE(payment_date) AS payment_date,
            SUM(amount) AS total_rental_payments
          FROM
            rental_payments
          GROUP BY
            DATE(payment_date)
        ) rp ON DATE(ds.sales_date) = rp.payment_date
        WHERE ds.sales_date BETWEEN '#{month.beginning_of_month}' AND '#{month.end_of_month}'
        GROUP BY
          ROLLUP (DATE(ds.sales_date))
        ORDER BY
          DATE(ds.sales_date);
      "

      ActiveRecord::Base.connection.exec_query(report_sql)
    end

    def total_sales
      @total_sales = result.last['Total']
    end
  end
end
