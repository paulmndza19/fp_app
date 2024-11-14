class AddAmountToClaimRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_requests, :amount, :decimal
  end
end
