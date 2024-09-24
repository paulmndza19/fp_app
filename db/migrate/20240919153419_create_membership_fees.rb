class CreateMembershipFees < ActiveRecord::Migration[7.1]
  def change
    create_table :membership_fees, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.decimal :amount

      t.timestamps
    end
  end
end
