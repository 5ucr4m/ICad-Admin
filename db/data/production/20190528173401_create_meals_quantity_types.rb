# frozen_string_literal: true

class CreateMealsQuantityTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: '1 vez'.mb_chars.upcase, reference: 34, generic_field: :meals_quantity_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: '2 ou 3 vezes'.mb_chars.upcase, reference: 35, generic_field: :meals_quantity_type, generic_class: InStreetSituationMeal.model_name.name)
    GenericModel.create!(name: 'mais de 3 vezes'.mb_chars.upcase, reference: 36, generic_field: :meals_quantity_type, generic_class: InStreetSituationMeal.model_name.name)
  end

  def down; end
end
