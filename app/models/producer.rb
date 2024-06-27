class Producer < ApplicationRecord
  has_many :castings, dependent: :destroy
  belongs_to :user
  has_one_attached :profile_picture

  validates :name, presence: true
  validates :bio, presence: true
end
