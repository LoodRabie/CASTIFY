class Casting < ApplicationRecord
  belongs_to :producer
  has_one_attached :photo

  has_many :auditions, dependent: :destroy
  has_one_attached :video

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_dancing_styles_and_location_and_deadline,
    against: [ :title, :description, :dancing_style, :location, :deadline ],
    using: {
      tsearch: { prefix: true }
    }

  validates :title, presence: true
  validates :description, presence: true
  validates :dancing_style, presence: true
  validates :deadline, presence: true
  validates :location, presence: true
end
