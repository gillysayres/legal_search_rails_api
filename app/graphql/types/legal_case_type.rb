module Types
  class LegalCaseType < Types::BaseObject
    field :id, ID, null: false
    field :cnj_number, String, null: false
    field :party_names, String, null: false
    field :origin_court, String, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :movements, [Types::MovementType], null: false
  end
end