class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :author
      t.string :author_email
      t.string :author_url
      t.datetime :date
      t.text :content
      t.boolean :approved

      t.timestamps
    end
  end
end
