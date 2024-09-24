class AddDeletedAtToRentalPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :rental_payments, :deleted_at, :datetime
  end
end
