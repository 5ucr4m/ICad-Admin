# frozen_string_literal: true

class CreateWaterTreatmentTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Filtrada'.mb_chars.upcase, reference: 97, generic_field: :water_treatment, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Fervida'.mb_chars.upcase, reference: 98, generic_field: :water_treatment, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Clorada'.mb_chars.upcase, reference: 99, generic_field: :water_treatment, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Mineral'.mb_chars.upcase, reference: 152, generic_field: :water_treatment, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Sem tratamento'.mb_chars.upcase, reference: 100, generic_field: :water_treatment, generic_class: LivingCondition.model_name.name)
  end

  def down; end
end
