class User < ActiveRecord::Base
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :dob, :username
  has_secure_password
  validates_presence_of :password, :on => :create
  
end
