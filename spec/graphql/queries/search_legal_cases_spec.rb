require 'rails_helper'

RSpec.describe 'SearchLegalCases Query', type: :request do
  let!(:legal_cases) { create_list(:legal_case, 3) }

  it 'returns legal cases based on the cnj_number' do
    post '/graphql', params: { query: query(cnj_number: legal_cases.first.cnj_number) }

    json = JSON.parse(response.body)
    data = json['data']['searchLegalCases']

    expect(data).to include(a_hash_including('cnjNumber' => legal_cases.first.cnj_number))
    expect(data.length).to eq(1)
  end

  def query(cnj_number:)
    <<~GQL
      query {
        searchLegalCases(cnjNumber: "#{cnj_number}") {
          cnjNumber
          partyNames
          originCourt
          startDate
        }
      }
    GQL
  end
end
