class CreateHomeRegistrationPets < ActiveRecord::Migration[6.0]
  def change
    create_table :home_registration_pets do |t|
      t.belongs_to :home_registration, foreign_key: true, index: true
      t.belongs_to :pet_type, foreign_key: {to_table: :generic_models}, index: true
      t.belongs_to :company, foreign_key: true, index: true
      t.string :slug

      t.timestamps
    end
  end
end
