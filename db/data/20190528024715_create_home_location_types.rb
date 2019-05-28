class CreateHomeLocationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Urbana'.mb_chars.upcase, reference: 83, generic_field: :home_location, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Rural'.mb_chars.upcase, reference: 84, generic_field: :home_location, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
