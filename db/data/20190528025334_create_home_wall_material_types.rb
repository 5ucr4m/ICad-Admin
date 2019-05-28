class CreateHomeWallMaterialTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Alvenaria com revestimento'.mb_chars.upcase, reference: 109, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Alvenaria sem revestimento'.mb_chars.upcase, reference: 110, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Taipa com revestimento'.mb_chars.upcase, reference: 111, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Taipa sem revestimento'.mb_chars.upcase, reference: 112, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Madeira emparelhada'.mb_chars.upcase, reference: 113, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Material aproveitado'.mb_chars.upcase, reference: 114, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Palha'.mb_chars.upcase, reference: 115, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outro material'.mb_chars.upcase, reference: 116, generic_field: :home_wall_material, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
