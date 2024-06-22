class Producer < ApplicationRecord
  belongs_to :user

  has_many :castings, dependent: :destroy

  validates :name, presence: true
  validates :bio, presence: true
end
