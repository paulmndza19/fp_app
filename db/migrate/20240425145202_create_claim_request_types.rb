class CreateClaimRequestTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :claim_request_types, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
