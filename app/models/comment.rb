class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user, :class_name => "User", :foreign_key => "author"

end
