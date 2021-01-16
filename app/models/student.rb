class Student < ApplicationRecord
  has_secure_password
  enum level: [:beginner, :intermediate, :advanced]

  has_many :matchings
  has_many :tutors, through: :matchings
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }, allow_blank: true
  validates :country, presence: true, allow_blank: true
  validates :email, presence: true, uniqueness: true
end
