class AddDeletedAtToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :deleted_at, :datetime
  end
end
