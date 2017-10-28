class Friendship < ApplicationRecord
  belongs_to :friender, class_name: "User", required: true
  belongs_to :friendee, class_name: "User", required: true
end
