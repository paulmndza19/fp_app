module Admin
  class KioskRentalReportsController < Admin::ApplicationController
    require 'caxlsx'

    def index
      @result = result
      @total_sales = total_sales

      render "admin/kiosk_rental_reports/index"
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

        cell_rows = ('a'..'z').to_a

        sheet.add_row ['Cashflow Report'], style: header_style
        sheet.merge_cells("A1::#{cell_rows[result.columns.length - 1]}1")

        # Add the headers
        sheet.add_row result.columns

        # Add data rows
        result.each do |data|
          sheet.add_row data.values
        end
      end

      # Send the Excel file as a response
      file_name = "kiosk_rental_report_#{month.strftime('%Y%m%d')}.xlsx"
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
          COALESCE(TO_CHAR(DATE(rp.created_at), 'FMDay, FMMonth DD, YYYY'), 'Total') AS \"Date\",
          COALESCE(SUM(rp.amount), 0) AS \"Total Kiosk Payments\"
        FROM
          rental_payments rp
        WHERE rp.created_at BETWEEN '#{month.beginning_of_month}' AND '#{month.end_of_month}'
        GROUP BY
            ROLLUP (DATE(rp.created_at))
        ORDER BY
          DATE(rp.created_at);
      "

      ActiveRecord::Base.connection.exec_query(report_sql)
    end

    def total_sales
      @total_sales = result.last['Total']
    end
  end
end