class AddApprovedAtAndRejectedAtToClaimRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_requests, :approved_at, :timestamp
    add_column :claim_requests, :rejected_at, :timestamp
  end
end
