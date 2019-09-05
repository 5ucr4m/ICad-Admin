# frozen_string_literal: true

class CreateWaterSupplyTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Rede encanada até o domicílio'.mb_chars.upcase, reference: 117, generic_field: :water_supply, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Poço / Nascente no domicílio'.mb_chars.upcase, reference: 118, generic_field: :water_supply, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Cisterna'.mb_chars.upcase, reference: 119, generic_field: :water_supply, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Carro pipa'.mb_chars.upcase, reference: 120, generic_field: :water_supply, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 121, generic_field: :water_supply, generic_class: LivingCondition.model_name.name)
  end

  def down; end
end
