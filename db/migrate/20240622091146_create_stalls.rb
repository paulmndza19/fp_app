class CreateStalls < ActiveRecord::Migration[7.1]
  def change
    create_table :stalls do |t|
      t.string :name

      t.timestamps
    end
  end
end
