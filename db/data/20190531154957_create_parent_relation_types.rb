class CreateParentRelationTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Cônjuge / Companheiro(a)'.mb_chars.upcase, reference: 137, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Filho(a)'.mb_chars.upcase, reference: 138, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Enteado(a)'.mb_chars.upcase, reference: 139, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Neto(a) / Bisneto(a)'.mb_chars.upcase, reference: 140, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Pai / Mãe'.mb_chars.upcase, reference: 141, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Sogro(a)'.mb_chars.upcase, reference: 142, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Irmão / Irmã'.mb_chars.upcase, reference: 143, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Genro / Nora'.mb_chars.upcase, reference: 144, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Outro parente'.mb_chars.upcase, reference: 145, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
    GenericModel.create!(name: 'Não parente'.mb_chars.upcase, reference: 146, generic_field: :parent_relation, generic_class: SociodemographicInfo.model_name.name)
  end

  def down

  end
end
