class AddTrelloExcludeTrackerFromSyncToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :trello_excluded_trackers, :text, :default => nil
  end
end
