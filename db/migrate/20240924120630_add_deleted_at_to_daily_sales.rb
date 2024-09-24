class AddDeletedAtToDailySales < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_sales, :deleted_at, :datetime
  end
end
