class RenameAccivementColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :accivement, :achivement
  end
end
