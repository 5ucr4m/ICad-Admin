class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.belongs_to :registry, null: false, foreign_key: true
      t.belongs_to :gender, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
      t.belongs_to :birth_state, null: false, foreign_key: true
      t.belongs_to :nationality, null: false, foreign_key: true
      t.date :birth_date
      t.belongs_to :birth_country, null: false, foreign_key: true
      t.string :mother_name
      t.string :sus_card_number
      t.string :pis_pasep_number
      t.boolean :unknown_mother_name
      t.belongs_to :responsible_person, null: false, foreign_key: true
      t.belongs_to :health_condition, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
