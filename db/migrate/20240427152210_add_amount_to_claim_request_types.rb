class AddAmountToClaimRequestTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_request_types, :amount, :decimal
  end
end
