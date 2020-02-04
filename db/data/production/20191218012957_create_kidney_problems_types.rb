# frozen_string_literal: true

class CreateKidneyProblemsTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Insuficiência renal'.mb_chars.upcase, reference: 27, generic_field: :kidney_problem, generic_class: HealthConditionKidney.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 28, generic_field: :kidney_problem, generic_class: HealthConditionKidney.model_name.name)
    GenericModel.create!(name: 'Não sabe'.mb_chars.upcase, reference: 29, generic_field: :kidney_problem, generic_class: HealthConditionKidney.model_name.name)
  end

  def down; end
end
