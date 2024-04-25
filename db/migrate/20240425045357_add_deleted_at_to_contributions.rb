class AddDeletedAtToContributions < ActiveRecord::Migration[7.1]
  def change
    add_column :contributions, :deleted_at, :datetime
    add_index :contributions, :deleted_at
  end
end
