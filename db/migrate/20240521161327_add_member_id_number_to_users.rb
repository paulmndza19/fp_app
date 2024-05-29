class AddMemberIdNumberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :member_id_number, :string
  end
end
