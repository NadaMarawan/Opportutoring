class Tutor < ApplicationRecord
  has_many :matchings
  has_many :students, through: :matchings
end
