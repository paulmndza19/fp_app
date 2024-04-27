class CreateClaimRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :claim_requests, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :claim_request_type, null: false, foreign_key: true, type: :uuid
      t.string :status
      t.decimal :amount

      t.timestamps
    end
  end
end
