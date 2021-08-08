class Patient < ApplicationRecord
  has_many :records
  has_many :behaviors
  has_many :results

  enum sex: { male: 1, female: 2, other: 3 }, _prefix: true
end
