class AddTrelloBoardIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :trello_board_id, :string, :default => "", :null => false
    add_column :projects, :trello_board_sync, :boolean, :default => false, :null => false
  end
end
