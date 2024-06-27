class DancerAudition < ApplicationRecord
  belongs_to :dancer
  belongs_to :audition

  validates :dancer_id, presence: true
  validates :audition_id, presence: true
end
