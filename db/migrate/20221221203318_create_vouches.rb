class CreateVouches < ActiveRecord::Migration[7.0]
  def change
    create_table :vouches do |t|
      t.string :description
      t.string :signature
      t.string :from 

      t.timestamps
    end
  end
end
