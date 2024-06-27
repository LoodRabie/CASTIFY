class Dancer < ApplicationRecord
  belongs_to :user

  has_many :dancer_auditions, dependent: :destroy
  has_many :auditions, through: :dancer_auditions

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true
  validates :bio, presence: true
end
