class Post < ActiveRecord::Base

  has_many :comments

  validates :permalink, :presence => true, :uniqueness => true
  validates :title, :presence => true
  validates :content, :presence => true

  before_save :encrypt, :if => self.post_type == "diary"

  def encrypt

  end

end
