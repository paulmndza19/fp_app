class UpdateContributionsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column(:contributions, :month)
    add_column(:contributions, :month, :date)
    remove_column(:contributions, :year)
  end
end
