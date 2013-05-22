class AddToUser < ActiveRecord::Migration
  def change
    add_column :users, :pvt_key, :text
    add_column :users, :pub_key, :text
  end
end
