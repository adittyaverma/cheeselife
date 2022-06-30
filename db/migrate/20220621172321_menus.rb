class Menus < ActiveRecord::Migration[5.2]
  def change
  	create_table :menus do |t|
      t.string :name
      t.string :summary
      t.integer :user_id

      t.timestamps
    end
  end
end
