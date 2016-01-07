class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.integer :userid
      t.integer :dishid
      t.text :content
      t.datetime :createtime
      t.integer :score
      t.timestamps
    end
  end
end
