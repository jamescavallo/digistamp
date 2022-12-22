class AddReuptationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reputation, :integer
  end
end
