# frozen_string_literal: true

class CreateResponsibleChildTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Adulto responsável'.mb_chars.upcase, reference: 1, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outra(s) criança(s)'.mb_chars.upcase, reference: 2, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Adolescente'.mb_chars.upcase, reference: 133, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Sozinha'.mb_chars.upcase, reference: 3, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Creche'.mb_chars.upcase, reference: 134, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 4, generic_field: :responsible_child, generic_class: SociodemographicInfo.model_name.name)
  end

  def down; end
end
