class AddRoleIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :role, null: false, foreign_key: true, type: :uuid
  end
end
