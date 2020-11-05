class AddAccIdToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :acc_id, :string
  end
end
