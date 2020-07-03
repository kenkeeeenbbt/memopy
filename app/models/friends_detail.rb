class FriendsDetail < ApplicationRecord
  belongs_to :friend
  validates :feature, presence: true
  validates :content, presence: true
end
