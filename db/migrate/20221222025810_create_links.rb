class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :account_username
      t.string :account_id
      t.integer :media_count

      t.timestamps
    end
  end
end
