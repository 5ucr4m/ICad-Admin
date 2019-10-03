# frozen_string_literal: true

class CreateStreetSituationTimeTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Menos de 6 meses'.mb_chars.upcase, reference: 17, generic_field: :street_situation_time, generic_class: InStreetSituation.model_name.name)
    GenericModel.create!(name: '6 a 12 meses'.mb_chars.upcase, reference: 18, generic_field: :street_situation_time, generic_class: InStreetSituation.model_name.name)
    GenericModel.create!(name: '1 a 5 anos'.mb_chars.upcase, reference: 19, generic_field: :street_situation_time, generic_class: InStreetSituation.model_name.name)
    GenericModel.create!(name: 'Mais de 5 anos'.mb_chars.upcase, reference: 20, generic_field: :street_situation_time, generic_class: InStreetSituation.model_name.name)
  end

  def down; end
end
