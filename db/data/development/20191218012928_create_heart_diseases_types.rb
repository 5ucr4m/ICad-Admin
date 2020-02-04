# frozen_string_literal: true

class CreateHeartDiseasesTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Insuficiência cardíaca'.mb_chars.upcase, reference: 24, generic_field: :heart_disease, generic_class: HealthConditionHeart.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 25, generic_field: :heart_disease, generic_class: HealthConditionHeart.model_name.name)
    GenericModel.create!(name: 'Não sabe'.mb_chars.upcase, reference: 26, generic_field: :heart_disease, generic_class: HealthConditionHeart.model_name.name)
  end

  def down; end
end
