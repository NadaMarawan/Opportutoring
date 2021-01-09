class Tutor < ApplicationRecord
  has_many :matchings
  has_many :students, through: :matchings
  has_one_attached :image
end
