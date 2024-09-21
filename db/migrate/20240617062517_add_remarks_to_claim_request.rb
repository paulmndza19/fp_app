class AddRemarksToClaimRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_requests, :remarks, :text
  end
end
