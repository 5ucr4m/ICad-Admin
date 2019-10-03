# frozen_string_literal: true

class CreateSexualOrientationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Heterossexual'.mb_chars.upcase, reference: 148, generic_field: :sexual_orientation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Homossexual (gay / lésbica)'.mb_chars.upcase, reference: 153, generic_field: :sexual_orientation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Bissexual'.mb_chars.upcase, reference: 154, generic_field: :sexual_orientation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 155, generic_field: :sexual_orientation, generic_class: SociodemographicInfo.model_name.name)
  end

  def down; end
end
