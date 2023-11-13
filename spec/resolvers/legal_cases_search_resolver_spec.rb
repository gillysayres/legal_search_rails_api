RSpec.describe Resolvers::LegalCasesSearchResolver, type: :resolver do
  let!(:legal_cases) { create_list(:legal_case, 3) }

  # Mocking the required arguments
  let(:dummy_object) { double("object") }
  let(:dummy_field) { double("field") }

  # Creating a more specific mock for context
  let(:dummy_context) { 
    double("context", warden: double("warden").as_null_object) 
  }

  it 'finds legal cases by cnj_number' do
    result = Resolvers::LegalCasesSearchResolver.new(object: dummy_object, context: dummy_context, field: dummy_field).resolve(cnj_number: legal_cases.first.cnj_number)
    expect(result).to include(legal_cases.first)
    expect(result).not_to include(legal_cases.second, legal_cases.third)
  end

  it 'returns no results if cnj_number is not provided' do
    result = Resolvers::LegalCasesSearchResolver.new(object: dummy_object, context: dummy_context, field: dummy_field).resolve(cnj_number: nil)
    expect(result).to be_empty
  end
end
