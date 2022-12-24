class AddAccountsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_num, :integer
  end
end
