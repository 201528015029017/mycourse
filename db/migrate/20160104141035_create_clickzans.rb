class CreateClickzans < ActiveRecord::Migration
  def change
    create_table :clickzans do |t|

      t.integer :userid
      t.integer :topicid
      t.timestamps
    end
  end
end
