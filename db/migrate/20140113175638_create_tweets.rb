class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

      t.timestamps
      t.string "status"
      t.integer "bootcamp_id"
    end
  end
end
