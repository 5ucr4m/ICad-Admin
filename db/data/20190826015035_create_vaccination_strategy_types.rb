class CreateVaccinationStrategyTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Rotina'.mb_chars.upcase, reference: 1, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Especial'.mb_chars.upcase, reference: 2, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Bloqueio'.mb_chars.upcase, reference: 3, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Intensificação'.mb_chars.upcase, reference: 4, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Campanha'.mb_chars.upcase, reference: 5, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Soroterapia'.mb_chars.upcase, reference: 7, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
    GenericModel.create!(name: 'Multivacinação'.mb_chars.upcase, reference: 10, generic_field: :vaccination_strategy, generic_class: Vaccine.model_name.name)
  end

  def down

  end
end
