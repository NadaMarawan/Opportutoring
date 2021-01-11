class Student < ApplicationRecord
  has_secure_password
  enum level: [:beginner, :intermediate, :advanced]

  has_many :matchings
  has_many :tutors, through: :matchings
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :country, presence: true
  validates :email, presence: true, uniqueness: true
end
