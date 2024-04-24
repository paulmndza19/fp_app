class CreateContributions < ActiveRecord::Migration[7.1]
  def change
    create_table :contributions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end
