class CreateCommentuiComments < ActiveRecord::Migration[5.1]
  def change
    create_table :commentui_comments do |t|
      t.references :thread,
                   null: false,
                   index: false,
                   foreign_key: {
                     to_table: :commentui_threads,
                     on_update: :cascade,
                     on_delete: :cascade,
                   }

      t.references :creator, polymorphic: true, null: false, index: false
      t.references :editor, polymorphic: true

      t.text :content, null: false
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :commentui_comments,
              [:creator_id, :creator_type, :thread_id],
              name: 'index_commentui_comments_on_c_id_and_c_type_and_t_id'

  end
end
