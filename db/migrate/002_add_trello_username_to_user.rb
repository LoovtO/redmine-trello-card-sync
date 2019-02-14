class AddTrelloUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :trello_username, :string, :default => "", :null => false
  end
end
