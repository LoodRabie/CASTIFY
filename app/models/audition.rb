class Audition < ApplicationRecord
  belongs_to :casting

  has_many :dancer_auditions, dependent: :destroy
  has_many :dancers, through: :dancer_auditions
  has_many :videos, dependent: :destroy

  validates :status, presence: true
  validates :date, presence: true
end
