class Company < ApplicationRecord
  belongs_to :profile

  validates :legal_name, presence: true, uniqueness: true
  validates :company_type, presence: true
  validates :registration_number, presence: true, uniqueness: true
end
