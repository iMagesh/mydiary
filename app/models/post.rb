class Post < ActiveRecord::Base

  acts_as_taggable
  has_many :comments
  #has_many :taggings
  #has_many :tags, through: :taggings

  validates :permalink, :presence => true, :uniqueness => true, :on => :create
  validates :title, :presence => true
  validates :content, :presence => true

  before_save :encrypt#, :if => self.post_type == "diary"

  def encrypt
    return if self.post_type != "diary"

    keypair = OpenSSL::PKey::RSA.new(2048)
    pub_key = keypair.public_key

    # You can encrypt with the private key and decrypt with the public key.
    encrypted = keypair.private_encrypt(content)
  end

end
