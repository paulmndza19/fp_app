class AddDeletedAtToExpenseCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :expense_categories, :deleted_at, :datetime
  end
end
