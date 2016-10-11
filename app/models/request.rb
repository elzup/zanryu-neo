class Request < ApplicationRecord
  belongs_to :user
  belongs_to :admin, :class_name => 'User'
  belongs_to :room
end
