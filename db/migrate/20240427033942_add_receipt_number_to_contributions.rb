class AddReceiptNumberToContributions < ActiveRecord::Migration[7.1]
  def change
    add_column :contributions, :receipt_number, :string
    add_index :contributions, :receipt_number, unique: true
  end
end
