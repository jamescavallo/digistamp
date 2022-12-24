class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string 'account_type'
      t.text 'account_username'
      t.text 'account_id'
      t.integer 'media_count'
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
