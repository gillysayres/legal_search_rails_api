require 'rails_helper'

RSpec.describe Types::LegalCaseType do
  let(:fields) { %w[id cnjNumber partyNames originCourt startDate movements] }

  it 'has the correct fields' do
    fields.each do |field|
      expect(described_class.fields).to include(field)
    end
  end
end