class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :is_enabled, :boolean, default: true, null:false
    add_column :users, :profile_image_id, :string
    add_column :users, :accivement, :integer, null: false, default: 0
  end
end
