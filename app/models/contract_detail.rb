require 'date'

class ContractDetail < ApplicationRecord
  belongs_to :contract
  validate :validate_start_date

  validates :contract_name, presence: true
  validates :contractor_residence, presence: true
  validates :job_title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD" }

  # check if start_date is not behind today's data
  def validate_start_date
    @date = Date.current
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < @date
  end
end
