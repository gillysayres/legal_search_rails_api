class Movement < ApplicationRecord
  belongs_to :legal_case
  validates :date, :description, presence: true
end
