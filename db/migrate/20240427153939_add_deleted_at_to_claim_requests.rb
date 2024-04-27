class AddDeletedAtToClaimRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_requests, :deleted_at, :datetime
  end
end
