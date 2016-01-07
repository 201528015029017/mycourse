class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|

      t.integer :userid
      t.text :content
      t.datetime :createtime
      t.integer :count
      t.timestamps
    end
  end
end
