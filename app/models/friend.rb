class Friend < ApplicationRecord
  belongs_to :user
  has_many :friends_details, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 20 }
end
