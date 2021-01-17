class Student < ApplicationRecord
  has_secure_password
  enum level: [:beginner, :intermediate, :advanced]

  has_many :matchings
  has_many :tutors, through: :matchings
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }, if: :should_validate_password?
  validates :country, presence: true, if: :should_validate_country?
  validates :email, presence: true, uniqueness: true

  def should_validate_password?
    new_record? || (password.present? && password_confirmation.present?)
  end

  def should_validate_country?
    new_record? || country.present?
  end
end
