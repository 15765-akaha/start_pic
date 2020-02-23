class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title
      t.string :image_id
      t.boolean :is_enabled

      t.timestamps
    end
  end
end
