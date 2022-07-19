class ContractDetail < ApplicationRecord
  belongs_to :contract
  
  validates :contract_name, presence: true
  validates :contractor_residence, presence: true
  validates :job_title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true

end
