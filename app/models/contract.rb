class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :employee, class_name: 'User', foreign_key: 'employee_id'
  belongs_to :company
  has_many :payments
  has_one :contract_detail

  enum name: {
    fixedRate: 0,
    payAsYouGo: 1,
    milestone: 2
  }

  validates :name, presence: true
end
