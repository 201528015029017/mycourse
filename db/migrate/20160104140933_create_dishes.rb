class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :dishname
      t.float :price
      t.integer :dining
      t.integer :floor
      t.string :tags
      t.integer :score
      t.integer :count
      t.datetime :createtime
      t.string :picurl
      t.text :describtion
      t.timestamps
    end
  end
end
