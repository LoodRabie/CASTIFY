class Dancer < ApplicationRecord
  belongs_to :user

  has_many :dancer_auditions, dependent: :destroy
  has_many :auditions, through: :dancer_auditions
  has_one_attached :profile_picture

  include PgSearch::Model
  multisearchable against: [:name, :age, :location, :dancing_styles, :bio ]

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, :bio, presence: true
end
