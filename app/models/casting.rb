class Casting < ApplicationRecord
  belongs_to :producer
  validates :title, :description, :dancing_style, :deadline, :location, presence: true
end
