# frozen_string_literal: true

class CreateRuralProductionAreaTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Proprietário'.mb_chars.upcase, reference: 101, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Parceiro(a) / Meeiro(a)'.mb_chars.upcase, reference: 102, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Assentado(a)'.mb_chars.upcase, reference: 103, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Posseiro'.mb_chars.upcase, reference: 104, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Arrendatário(a)'.mb_chars.upcase, reference: 105, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Comodatário(a)'.mb_chars.upcase, reference: 106, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Beneficiário(a) do banco da terra'.mb_chars.upcase, reference: 107, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Não se aplica'.mb_chars.upcase, reference: 108, generic_field: :rural_production_area, generic_class: LivingCondition.model_name.name)
  end

  def down; end
end
