class CreateHomeTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Casa'.mb_chars.upcase, reference: 85, generic_field: :home_type, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Apartamento'.mb_chars.upcase, reference: 86, generic_field: :home_type, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Cômodo'.mb_chars.upcase, reference: 87, generic_field: :home_type, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outro'.mb_chars.upcase, reference: 88, generic_field: :home_type, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
