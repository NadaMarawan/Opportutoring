class Student < ApplicationRecord
  enum level: [:beginner, :intermediate, :advanced]

  has_many :matchings
  has_many :tutors, through: :matchings
  has_one_attached :image
end
