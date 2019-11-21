class AddColumnHasChildrenToCommentuiComments < ActiveRecord::Migration[5.1]
  def change
    add_column :commentui_comments, :has_children, :boolean, default: false
  end
end
