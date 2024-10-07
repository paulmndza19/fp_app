class AddPaymentDateToRentalPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :rental_payments, :payment_date, :date
  end
end
