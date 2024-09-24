class CreateStallRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :stall_rentals, id: :uuid do |t|
      t.references :tenant, null: false, foreign_key: true, type: :uuid
      t.references :stall, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
