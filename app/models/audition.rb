class Audition < ApplicationRecord
  belongs_to :casting

  has_many :dancer_auditions, dependent: :destroy
  has_many :dancers, through: :dancer_auditions
  has_many_attached :videos, dependent: :destroy

  STATUSES = %w[pending accepted denied]

  validates :status, inclusion: { in: STATUSES }
  validates :date, presence: true
end
