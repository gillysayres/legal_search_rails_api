class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.references :legal_case, null: false, foreign_key: true
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
