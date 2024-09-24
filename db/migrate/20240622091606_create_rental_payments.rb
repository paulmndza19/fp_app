class CreateRentalPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :rental_payments, id: :uuid do |t|
      t.references :stall_rental, null: false, foreign_key: true, type: :uuid
      t.decimal :amount

      t.timestamps
    end
  end
end
