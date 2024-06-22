class Casting < ApplicationRecord
  belongs_to :producer

  has_many :auditions, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :dancing_style, presence: true
  validates :deadline, presence: true
  validates :location, presence: true
end
