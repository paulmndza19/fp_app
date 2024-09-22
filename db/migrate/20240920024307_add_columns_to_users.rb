class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :text
    add_column :users, :contact_no, :string
    add_column :users, :civil_status, :string
    add_column :users, :date_employed, :date
    add_column :users, :start_of_membership, :date
    add_column :users, :no_of_children, :integer
    add_column :users, :parent_name, :string
    add_column :users, :full_time, :boolean
    add_column :users, :office, :string
  end
end
