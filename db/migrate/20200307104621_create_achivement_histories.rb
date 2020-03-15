class CreateAchivementHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :achivement_histories do |t|
      t.integer :user_id
      t.integer :achivement

      t.timestamps
    end
  end
end
