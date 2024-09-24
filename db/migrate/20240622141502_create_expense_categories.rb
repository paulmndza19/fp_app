class CreateExpenseCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :expense_categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
