class SetDefaultValueToMenus < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :menus, :status, true
	end
end
