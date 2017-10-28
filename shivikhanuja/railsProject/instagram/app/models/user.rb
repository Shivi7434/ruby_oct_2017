class User < ApplicationRecord
    has_many :follows, foreign_key: :follower_id, class_name: Follow
    has_many :following, through: :follows, source: :followee

    has_many :being_followed, foreign_key: :followee_id, class_name: Follow
    has_many :followers, through: :being_followed, source: :follower
end
