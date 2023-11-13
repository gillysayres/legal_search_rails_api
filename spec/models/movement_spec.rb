require 'rails_helper'

RSpec.describe Movement, type: :model do
  describe 'associations' do
    it { should belong_to(:legal_case) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
  end
end
