class AddDeletedAtToSalesCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :sales_categories, :deleted_at, :datetime
  end
end
