class Contract < ApplicationRecord
  belongs_to :user
  has_one :contract_detail

  enum name: {
    fixedRate: 0,
    payAsYouGo: 1,
    milestone: 2
  }
end
