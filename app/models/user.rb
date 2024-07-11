class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :producer, dependent: :destroy
  has_one :dancer, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  def producer?
    role == 'producer'
  end

  def dancer?
    role == 'dancer'
  end
end
