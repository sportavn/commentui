# This migration comes from commentui (originally 20191012044238)
class CreateCommentuiThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :commentui_threads do |t|
      t.references :commentable,
                   polymorphic: true,
                   index: { unique: true }
      t.references :closer, polymorphic: true

      t.datetime :closed_at

      t.timestamps null: false
    end
  end
end
