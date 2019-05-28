class CreateWeightSituationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Abaixo do peso'.mb_chars.upcase, reference: 21, generic_field: :weight_situation_type, generic_class: HealthCondition.model_name.name)
    GenericModel.create!(name: 'Peso adequado'.mb_chars.upcase, reference: 22, generic_field: :weight_situation_type, generic_class: HealthCondition.model_name.name)
    GenericModel.create!(name: 'Acima do peso'.mb_chars.upcase, reference: 23, generic_field: :weight_situation_type, generic_class: HealthCondition.model_name.name)

  end

  def down

  end
end
