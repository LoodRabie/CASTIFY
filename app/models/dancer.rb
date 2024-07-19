class Dancer < ApplicationRecord
  belongs_to :user

  has_many :dancer_auditions, dependent: :destroy
  has_many :auditions, through: :dancer_auditions
  has_one_attached :profile_picture

  include PgSearch::Model
  pg_search_scope :search_by_name_and_age_and_location_and_bio_and_dancing_styles,
                  against: %i[name age location bio dancing_styles],
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, :bio, presence: true
end
