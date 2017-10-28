class Like < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :secret, counter_cache: true, required: true
end