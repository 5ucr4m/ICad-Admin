class CreateBathroomDrainageTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Rede coletora de esgoto / pluvial'.mb_chars.upcase, reference: 122, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Fossa séptica'.mb_chars.upcase, reference: 123, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Fossa rudimentar'.mb_chars.upcase, reference: 124, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Direto para um rio / lago / mar'.mb_chars.upcase, reference: 125, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Céu aberto'.mb_chars.upcase, reference: 126, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
    GenericModel.create!(name: 'Outra forma'.mb_chars.upcase, reference: 127, generic_field: :bathroom_drainage, generic_class: LivingCondition.model_name.name)
  end

  def down

  end
end
