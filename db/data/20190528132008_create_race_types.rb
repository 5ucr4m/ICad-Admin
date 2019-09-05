# frozen_string_literal: true

class CreateRaceTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Branca'.mb_chars.upcase, reference: 1, generic_field: :race, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Preta'.mb_chars.upcase, reference: 2, generic_field: :race, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Parda'.mb_chars.upcase, reference: 4, generic_field: :race, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Amarela'.mb_chars.upcase, reference: 3, generic_field: :race, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Indígena'.mb_chars.upcase, reference: 5, generic_field: :race, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Sem informação'.mb_chars.upcase, reference: 6, generic_field: :race, generic_class: FamilyMember.model_name.name)
  end

  def down; end
end
