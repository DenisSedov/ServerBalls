class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :idplayer
      t.string :name
      t.float :color
      t.integer :score
      t.float :x
      t.float :y
      t.float :radius

      t.timestamps null: false
    end
  end
end
