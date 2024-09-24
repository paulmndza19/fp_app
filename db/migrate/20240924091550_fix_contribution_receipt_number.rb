class FixContributionReceiptNumber < ActiveRecord::Migration[7.1]
  def change
    remove_index(:contributions, :receipt_number)
  end
end
