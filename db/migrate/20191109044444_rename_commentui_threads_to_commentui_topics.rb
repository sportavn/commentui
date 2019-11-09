class RenameCommentuiThreadsToCommentuiTopics < ActiveRecord::Migration[5.1]
  def change
    rename_column :commentui_comments, :thread_id, :topic_id
    rename_table :commentui_threads, :commentui_topics
  end
end
