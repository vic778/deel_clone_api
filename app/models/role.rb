class Role < ApplicationRecord
  has_many :users

  enum name: {
    user: 0,
    company: 1,
    admin: 2
  }

  validates :name, presence: true, uniqueness: true
end
