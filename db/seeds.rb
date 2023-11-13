require 'faker'
require 'set'

# List of courts for each state in Brazil
brazil_courts = [
  "TJAC", "TJSP", "TJPE", "TJAM", "TJPI", "TJAP", "TJPR", "TJBA",
  "TJPB", "TJCE", "TJRJ", "TJDFT", "TJRN", "TJES", "TJRS", "TJGO",
  "TJRO", "TJMA", "TJRR", "TJMG", "TJSC", "TJMT", "TJSE", "TJMS",
  "TJTO", "TJPA"
]

# Array of pre-generated CNJ numbers
pre_generated_cnj_numbers = [
  # ... [CNJ numbers list remains unchanged] ...
]

# Function to calculate the CNJ check digits
def calculate_cnj_check_digits(raw_cnj)
  numbers = raw_cnj.gsub(/[^\d]/, '').to_i
  mod = 98 - ((numbers * 100) % 97)
  mod.to_s.rjust(2, '0') # Ensure it's always two digits
end

# Initialize a set to keep track of used CNJ numbers
used_cnj_numbers = Set.new

pre_generated_cnj_numbers.each do |cnj_number|
  # Check if the CNJ number has already been used
  next if used_cnj_numbers.include?(cnj_number)

  # Add the CNJ number to the set of used numbers
  used_cnj_numbers.add(cnj_number)

  year = cnj_number.split('-').last.split('.').first.to_i
  legal_case = LegalCase.create(
    cnj_number: cnj_number,
    party_names: "#{Faker::Name.name} X #{Faker::Name.name}",
    origin_court: brazil_courts.sample,
    start_date: Faker::Date.backward(days: 365)
  )

  rand(5..30).times do
    description = Faker::Lorem.paragraph_by_chars(number: rand(30..300), supplemental: false)
    Movement.create(
      legal_case: legal_case,
      date: legal_case.start_date + rand(1..30).days,
      description: description
    )
  end
end

puts 'Seed data created successfully!'
