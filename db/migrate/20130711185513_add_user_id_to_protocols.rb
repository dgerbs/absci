class AddUserIdToProtocols < ActiveRecord::Migration
  def change
    add_column :protocols, :user_id, :integer, null: false
    add_index :protocols, :user_id
  end
end
