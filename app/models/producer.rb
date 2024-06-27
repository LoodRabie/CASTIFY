class Producer < ApplicationRecord
  has_many :castings, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :bio, presence: true
end
