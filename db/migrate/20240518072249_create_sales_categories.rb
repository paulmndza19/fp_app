class CreateSalesCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
