class AddReferenceParentToCommentuiComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :commentui_comments, :parent, foreign_key: {
      to_table: :commentui_comments, on_update: :restrict, on_delete: :cascade
    }
  end
end
