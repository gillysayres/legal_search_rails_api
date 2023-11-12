class CreateLegalCases < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_cases do |t|
      t.string :cnj_number
      t.string :party_names
      t.string :origin_court
      t.date :start_date

      t.timestamps
    end
  end
end
