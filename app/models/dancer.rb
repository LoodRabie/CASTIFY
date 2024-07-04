class Dancer < ApplicationRecord
  belongs_to :user

  has_many :dancer_auditions, dependent: :destroy
  has_many :auditions, through: :dancer_auditions

  include PgSearch::Model
  multisearchable against: [:name, :age, :location, :dancing_styles, :bio ]

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, :bio, :dancing_styles, presence: true
end
