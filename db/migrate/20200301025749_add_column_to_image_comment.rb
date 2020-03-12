class AddColumnToImageComment < ActiveRecord::Migration[5.2]
  def change
    add_column :image_comments, :comment, :text
  end
end
