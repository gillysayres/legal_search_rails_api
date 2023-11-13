class LegalCase < ApplicationRecord
  has_many :movements
  validates :cnj_number, :party_names, :origin_court, :start_date, presence: true
  validates :cnj_number, uniqueness: true
end
