class Patient < ApplicationRecord
  has_many :records
  has_many :behaviors
  has_many :results
end
