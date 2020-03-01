class AddColumnToImageComment < ActiveRecord::Migration[5.2]
  def change
    add_column :image_comments, :comment, :text, null: false, default: ""
  end
end
