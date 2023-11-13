FactoryBot.define do
  factory :movement do
    legal_case
    date { "2023-01-02" }
    description { "Initial filing" }

    after(:create) do |movement|
      create_list(:movement, 3, legal_case: movement.legal_case)
    end
  end
end
