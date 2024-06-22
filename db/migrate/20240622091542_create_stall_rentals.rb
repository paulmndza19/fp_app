class CreateStallRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :stall_rentals do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :stall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
