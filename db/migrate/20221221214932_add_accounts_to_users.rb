class AddAccountsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :accounts, :integer
  end
end
