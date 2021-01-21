class Tutor < ApplicationRecord
  # Encrypt password: hash password (stores it as password digest)
  has_secure_password

  # Associations
  has_many :matchings
  has_many :students, through: :matchings
  has_one_attached :image

  # Validations
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }, if: :should_validate_password?
  validates :country, presence: true, if: :should_validate_country?
  validates :email, presence: true, uniqueness: true

  # Only validate the password if it is a new record OR if user changes their password
  # Used when trying to update profiles
  def should_validate_password?
    new_record? || (password.present? && password_confirmation.present?)
  end

  def should_validate_country?
    new_record? || country.present?
  end
end
