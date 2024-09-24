class AddDeletedAtToTenants < ActiveRecord::Migration[7.1]
  def change
    add_column :tenants, :deleted_at, :datetime
  end
end
