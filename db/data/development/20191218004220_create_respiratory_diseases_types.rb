class CreateRespiratoryDiseasesTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Asma'.mb_chars.upcase, reference: 30, generic_field: :respiratory_disease, generic_class: HealthConditionRespiratory.model_name.name)
    GenericModel.create!(name: 'DPOC / Enfisema'.mb_chars.upcase, reference: 31, generic_field: :respiratory_disease, generic_class: HealthConditionRespiratory.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 32, generic_field: :respiratory_disease, generic_class: HealthConditionRespiratory.model_name.name)
    GenericModel.create!(name: 'Não sabe'.mb_chars.upcase, reference: 33, generic_field: :respiratory_disease, generic_class: HealthConditionRespiratory.model_name.name)
  end

  def down

  end
end
