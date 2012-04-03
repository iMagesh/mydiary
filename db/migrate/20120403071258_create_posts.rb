class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.datetime :date
      t.text :content
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
