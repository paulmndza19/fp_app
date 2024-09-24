class CreateDailyExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_expenses, id: :uuid do |t|
      t.references :expense_category, null: false, foreign_key: true, type: :uuid
      t.decimal :amount
      t.date :expense_date

      t.timestamps
    end
  end
end
