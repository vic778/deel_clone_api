class Contract < ApplicationRecord
  belongs_to :user

  enum name: {
    fixedRate: 0,
    payAsYouGo: 1,
    milestone: 2,
  }

end
