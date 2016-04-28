class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.float :x
      t.float :y
      t.float :color
      t.integer :typeball

      t.timestamps null: false
    end
  end
end
