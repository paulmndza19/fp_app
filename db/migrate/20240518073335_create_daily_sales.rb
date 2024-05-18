class CreateDailySales < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_sales do |t|
      t.references :sales_category, null: false, foreign_key: true
      t.decimal :amount
      t.date :sales_date

      t.timestamps
    end
  end
end
