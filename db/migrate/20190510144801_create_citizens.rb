class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.belongs_to :registry, foreign_key: true, index: true
      t.belongs_to :gender, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :race, foreign_key: {to_table: :generic_models}, index: true
      t.date :birth_date
      t.belongs_to :birth_state, foreign_key: {to_table: :states}, index: true
      t.belongs_to :birth_country, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :nationality, foreign_key: {to_table: :generic_models}, index: true
      t.string :sus_card_number
      t.string :pis_pasep_number
      t.boolean :unknown_mother_name
      t.belongs_to :responsible_person, foreign_key: {to_table: :citizens}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
