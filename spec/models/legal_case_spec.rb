require 'rails_helper'

RSpec.describe LegalCase, type: :model do
  # Check validations, associations, and other model logic
  describe 'associations' do
    it { should have_many(:movements) }
  end

  describe 'validations' do
    it { should validate_presence_of(:cnj_number) }
    it { should validate_presence_of(:party_names) }
    it { should validate_presence_of(:origin_court) }
    it { should validate_presence_of(:start_date) }
  end
end
