class RemoveAmountFromClaimRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :claim_requests, :amount
  end
end
