class AddDeletedAtToMembershipFees < ActiveRecord::Migration[7.1]
  def change
    add_column :membership_fees, :deleted_at, :datetime
  end
end
