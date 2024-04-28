class AddDefaultValueToStatusInClaimRequests < ActiveRecord::Migration[7.1]
  def change
    change_column :claim_requests, :status, :string, default: 'pending'
  end
end
