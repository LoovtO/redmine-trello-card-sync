class ChangeTrelloExcludeTrackerDefaultToProject < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :trello_excluded_trackers, :text
  end
end
