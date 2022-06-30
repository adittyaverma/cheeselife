class AddStatusToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :status, :boolean
  end
end
