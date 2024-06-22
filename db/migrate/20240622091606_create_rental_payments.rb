class CreateRentalPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :rental_payments do |t|
      t.references :stall_rental, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
