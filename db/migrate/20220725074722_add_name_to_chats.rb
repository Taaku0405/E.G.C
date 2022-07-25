class AddNameToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :name, :string
  end
end
