module Resolvers
  class LegalCasesSearchResolver < Resolvers::Base
    type [Types::LegalCaseType], null: false

    argument :cnj_number, String, required: false

    def resolve(cnj_number: nil)
      return LegalCase.none if cnj_number.blank?
    
      LegalCase.where("cnj_number LIKE ?", "%#{cnj_number}%")
    end
  end
end