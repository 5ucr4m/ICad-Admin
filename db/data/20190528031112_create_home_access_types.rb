# frozen_string_literal: true

class CreateHomeAccessTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Pavimento'.mb_chars.upcase, reference: 89, generic_field: :home_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Chão batido'.mb_chars.upcase, reference: 90, generic_field: :home_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Fluvial'.mb_chars.upcase, reference: 91, generic_field: :home_access, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 92, generic_field: :home_access, generic_class: LivingCondition.model_name.name)
  end

  def down; end
end
