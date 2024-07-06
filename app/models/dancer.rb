class Dancer < ApplicationRecord
  belongs_to :user

  has_many :dancer_auditions, dependent: :destroy
  has_many :auditions, through: :dancer_auditions

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, :bio, presence: true
end
