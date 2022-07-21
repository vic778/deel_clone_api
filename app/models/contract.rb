class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :payment
  has_one :contract_detail

  enum name: {
    fixedRate: 0,
    payAsYouGo: 1,
    milestone: 2
  }
end
