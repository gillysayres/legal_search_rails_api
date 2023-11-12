module Types
  class MovementType < Types::BaseObject
    field :id, ID, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :description, String, null: false
    field :legal_case, Types::LegalCaseType, null: false
  end
end