# frozen_string_literal: true

class CreateGarbageDisposalTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Coletado'.mb_chars.upcase, reference: 93, generic_field: :garbage_disposal, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Queimado / Enterrado'.mb_chars.upcase, reference: 94, generic_field: :garbage_disposal, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Céu aberto'.mb_chars.upcase, reference: 95, generic_field: :garbage_disposal, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 96, generic_field: :garbage_disposal, generic_class: LivingCondition.model_name.name)
  end

  def down; end
end
