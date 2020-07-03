class FriendsDetail < ApplicationRecord
  belongs_to :friend
  validates :feature, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 140 }
end
