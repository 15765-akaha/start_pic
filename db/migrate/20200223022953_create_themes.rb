class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title,		  null: false, default: ""
      t.string :image_id
      t.boolean :is_enabled,  default: true, null: false

      t.timestamps
    end
  end
end
