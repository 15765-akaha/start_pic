class CreateImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :image_comments do |t|
      t.refarences :user
      t.refarences :post_image

      t.timestamps
    end
  end
end
