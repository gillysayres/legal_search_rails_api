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
  '4347554-02.1998.7.56.5822', '3347608-27.1998.7.75.8644', '3496377-50.1998.3.52.8385',
  '1340901-60.1998.5.77.9591', '9178111-32.1998.2.30.5038', '6157310-81.1998.1.62.4734',
  '5005477-76.1998.7.48.9275', '6132681-64.1998.4.21.7440', '3515795-52.1998.1.15.2538',
  '7162709-93.1998.4.26.7137', '2256895-30.1998.4.74.7697', '4093507-69.1998.1.77.8444',
  '3268880-51.1998.1.75.6484', '9753494-45.1998.1.51.1226', '7117151-46.1998.3.41.1873',
  '8327364-19.1998.3.61.2758', '2449823-33.1998.2.23.6973', '7982550-32.1998.8.47.5970',
  '1030903-55.1998.3.63.8959', '4177809-31.1998.7.48.6797', '9285634-89.1998.3.83.1370',
  '5395084-20.1998.2.74.5169', '4723188-82.1998.1.57.3629', '1507516-34.1998.8.61.5097',
  '4584800-94.1998.2.90.8384', '3282761-28.1998.5.57.4879', '3668504-64.1998.6.35.4489',
  '1780238-70.1998.5.57.3569', '2228105-59.1998.9.30.8112', '6146518-33.1998.3.68.2342',
  '7293814-93.1998.8.28.7109', '4554169-27.1998.4.79.9866', '9387851-54.1998.8.60.2464',
  '5185189-50.1998.5.77.5665', '2377820-84.1998.5.44.1011', '5397812-58.1998.9.66.9700',
  '8689548-93.1998.1.33.5987', '4808630-66.1998.3.90.1968', '5874804-46.1998.4.22.4588',
  '9758681-44.1998.6.97.1094', '2766985-89.1998.5.73.2651', '7574375-79.1998.7.47.1385',
  '5171132-60.1998.5.97.2370', '7948293-07.1998.5.99.8937', '9631511-33.1998.3.61.2811',
  '6710057-96.1998.6.71.6054', '1078227-50.1998.9.34.9443', '5667608-93.1998.9.54.2100',
  '4209841-24.1998.4.27.8770', '5854873-36.1998.2.19.9817'
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
