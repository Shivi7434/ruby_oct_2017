class User < ApplicationRecord
  has_secure_password

  has_many :friended, foreign_key: :friender_id, class_name: "Friendship"
  has_many :friends, through: :friended, source: :friendee

  # Friend requests received 
  has_many :friendships, foreign_key: :friendee_id
  has_many :friended_by, through: :friendships, source: :friender


  email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  before_save :downcase

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness:true, format: { with: email_regex}
  validates :description, presence: true , length: { minimum: 10}



  def downcase
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
  end  
end
