class Organization < ApplicationRecord
  belongs_to :user, required: true
  
  has_many :members
  has_many :membering, through: :members, source: :user 

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
end
