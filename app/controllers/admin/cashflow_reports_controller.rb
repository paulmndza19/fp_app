module Admin
  class CashflowReportsController < Admin::ApplicationController
    require 'caxlsx'

    def index
      @result = result
      @total_sales = total_sales

      render "admin/cashflow_reports/index"
    end

    def download_excel
      # Create a new Excel package
      p = Axlsx::Package.new
      wb = p.workbook

      # Add a worksheet
      wb.add_worksheet(name: "Cashflow Report #{month.strftime('%m-%Y')}") do |sheet|
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

        sheet.add_row ['Cashflow Report'], style: header_style
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
      file_name = "cashflow_report_#{month.strftime('%Y%m%d')}.xlsx"
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
      report_sql = "
        SELECT
          COALESCE(TO_CHAR(DATE(ds.sales_date), 'FMDay, FMMonth DD, YYYY'), 'Total') AS \"Date\",
          SUM(ds.amount) + COALESCE(SUM(rp.amount), 0) AS \"Total Sales\",
          COALESCE(SUM(DISTINCT es.amount), 0) AS \"Total Expenses\",
          (SUM(ds.amount) + COALESCE(SUM(rp.amount), 0)) -  COALESCE(SUM(es.amount), 0) AS \"Total Income\"
        FROM
          daily_sales ds
        LEFT JOIN daily_expenses es ON DATE(ds.sales_date) =  DATE(es.expense_date)
        LEFT JOIN rental_payments rp ON DATE(ds.sales_date) = DATE(rp.created_at)
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
