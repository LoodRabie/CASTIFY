class Casting < ApplicationRecord
  belongs_to :producer
  has_one_attached :photo

  has_many :auditions, dependent: :destroy
  has_one_attached :video

  include PgSearch::Model
  multisearchable against: [ :title, :description, :dancing_style, :location, :deadline ]

  validates :title, presence: true
  validates :description, presence: true
  validates :dancing_style, presence: true
  validates :deadline, presence: true
  validates :location, presence: true
end
