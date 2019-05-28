class CreateHomeSituationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Próprio'.mb_chars.upcase, reference: 75, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Financiado'.mb_chars.upcase, reference: 76, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Alugado'.mb_chars.upcase, reference: 77, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Arrendado'.mb_chars.upcase, reference: 78, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Cedido'.mb_chars.upcase, reference: 79, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Ocupação'.mb_chars.upcase, reference: 80, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Situação de rua'.mb_chars.upcase, reference: 81, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outra'.mb_chars.upcase, reference: 82, generic_field: :home_situation, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
