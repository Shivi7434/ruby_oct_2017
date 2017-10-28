class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  before_save :downcase_fields

  validates :first_name, :last_name, presence: true 
  validates_format_of :first_name, :last_name, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_presence_of :password_confirmation, :if => :password_digest_changed?


  def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
  end
end