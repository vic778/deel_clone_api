class Company < ApplicationRecord
  belongs_to :profile
  has_many :contracts

  validates :legal_name, presence: true, uniqueness: true
  validates :company_type, presence: true
  validates :registration_number, presence: true, uniqueness: true
end
