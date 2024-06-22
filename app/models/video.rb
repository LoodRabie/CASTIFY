class Video < ApplicationRecord
  belongs_to :audition

  validates :videofile, presence: true
end
