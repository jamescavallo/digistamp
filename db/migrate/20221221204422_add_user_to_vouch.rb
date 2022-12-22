class AddUserToVouch < ActiveRecord::Migration[7.0]
  def change
    add_reference :vouches, :user, null: false, foreign_key: true
  end
end
