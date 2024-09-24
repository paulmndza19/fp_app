class AddDeletedAtToStallRentals < ActiveRecord::Migration[7.1]
  def change
    add_column :stall_rentals, :deleted_at, :datetime
  end
end
