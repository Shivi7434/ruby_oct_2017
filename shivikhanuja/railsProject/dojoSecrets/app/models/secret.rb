class Secret < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user

  validates :content, presence: true, length: 2..160
end