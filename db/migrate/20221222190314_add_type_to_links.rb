class AddTypeToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :type, :string
  end
end
