module Types
  class QueryType < Types::BaseObject
    field :search_legal_cases, resolver: Resolvers::LegalCasesSearchResolver
  end
end