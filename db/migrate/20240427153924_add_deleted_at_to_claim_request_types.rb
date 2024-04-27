class AddDeletedAtToClaimRequestTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :claim_request_types, :deleted_at, :datetime
  end
end
