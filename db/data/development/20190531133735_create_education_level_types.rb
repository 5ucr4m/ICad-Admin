# frozen_string_literal: true

class CreateEducationLevelTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Creche'.mb_chars.upcase, reference: 51, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Pré-escola (exceto CA)'.mb_chars.upcase, reference: 52, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Classe de alfabetização - CA'.mb_chars.upcase, reference: 53, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental 1ª a 4ª séries'.mb_chars.upcase, reference: 54, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental 5ª a 8ª séries'.mb_chars.upcase, reference: 55, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental completo'.mb_chars.upcase, reference: 56, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental especial'.mb_chars.upcase, reference: 61, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental EJA - séries iniciais (supletivo 1ª a 4ª)'.mb_chars.upcase, reference: 58, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino fundamental EJA - séries finais (supletivo 5ª a 8ª)'.mb_chars.upcase, reference: 59, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino médio, médio 2º ciclo (científico, técnico e etc)'.mb_chars.upcase, reference: 60, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino médio especial'.mb_chars.upcase, reference: 57, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Ensino médio EJA (supletivo)'.mb_chars.upcase, reference: 62, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Superior, aperfeiçoamento, especialização, mestrado, doutorado'.mb_chars.upcase, reference: 63, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Alfabetização para adultos (Mobral, etc)'.mb_chars.upcase, reference: 64, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Nenhum'.mb_chars.upcase, reference: 65, generic_field: :education_level, generic_class: SociodemographicInfo.model_name.name)
  end

  def down; end
end
