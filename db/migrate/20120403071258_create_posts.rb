class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.datetime :date
      t.text :content
      t.string :title
      t.string :status
      t.string :excerpt
      t.string :comment_status
      t.string :ping_status
      t.string :post_password
      t.string :permalink
      t.string :post_type
      t.integer :comment_count

      t.timestamps
    end
  end
end
