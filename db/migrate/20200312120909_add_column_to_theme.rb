class AddColumnToTheme < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :create_user_id, :integer
    add_column :themes, :admin, :boolean, default: false, null:false
  end
end
