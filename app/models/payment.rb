class Payment < ApplicationRecord
  belongs_to :contract
  belongs_to :user

  enum status: {
    pending: 0,
    published: 1,
    closed: 2
  }

  validates :amount, presence: true
  validates :status, presence: true
end
