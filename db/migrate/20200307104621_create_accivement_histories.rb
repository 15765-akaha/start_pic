class CreateAccivementHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :accivement_histories do |t|
      t.integer :user_id
      t.integer :accivement

      t.timestamps
    end
  end
end
