# frozen_string_literal: true

class CreatePetTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Gato'.mb_chars.upcase, reference: 128, generic_field: :pet_type, generic_class: HomeRegistrationPet.model_name.name)
    GenericModel.create!(name: 'Cachorro'.mb_chars.upcase, reference: 129, generic_field: :pet_type, generic_class: HomeRegistrationPet.model_name.name)
    GenericModel.create!(name: 'Pássaro'.mb_chars.upcase, reference: 130, generic_field: :pet_type, generic_class: HomeRegistrationPet.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 132, generic_field: :pet_type, generic_class: HomeRegistrationPet.model_name.name)
  end

  def down; end
end
