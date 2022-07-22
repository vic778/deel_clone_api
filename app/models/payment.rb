class Payment < ApplicationRecord
  belongs_to :contract
  belongs_to :user

  validates :amount, presence: true
end
