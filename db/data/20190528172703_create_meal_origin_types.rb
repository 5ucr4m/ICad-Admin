# frozen_string_literal: true

class CreateMealOriginTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Restaurante popular'.mb_chars.upcase, reference: 37, generic_field: :meals_origin_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: 'Doação grupo religioso'.mb_chars.upcase, reference: 38, generic_field: :meals_origin_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: 'Doação restaurante'.mb_chars.upcase, reference: 39, generic_field: :meals_origin_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: 'Doação popular'.mb_chars.upcase, reference: 40, generic_field: :meals_origin_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 41, generic_field: :meals_origin_type, generic_class: InStreetSituationMeal.model_name.name)
  end

  def down; end
end
