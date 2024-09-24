class AddDeletedAtToDailyExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_expenses, :deleted_at, :datetime
  end
end
