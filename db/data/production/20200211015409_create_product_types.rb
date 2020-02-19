class CreateProductTypes < SeedMigration::Migration
  def up
    GenericModel.create(name: 'Biológico'.mb_chars.upcase, reference: 1, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Novo'.mb_chars.upcase, reference: 2, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Biológicos'.mb_chars.upcase, reference: 3, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Similar'.mb_chars.upcase, reference: 4, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Genérico'.mb_chars.upcase, reference: 5, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Novo (Referência)'.mb_chars.upcase, reference: 6, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Específico'.mb_chars.upcase, reference: 7, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Fitoterápico'.mb_chars.upcase, reference: 8, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Biológico Novo'.mb_chars.upcase, reference: 9, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Similar (Referência)'.mb_chars.upcase, reference: 10, generic_field: :product_type, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Genérico (Referência)'.mb_chars.upcase, reference: 11, generic_field: :product_type, generic_class: Medicine.model_name.name)
  end

  def down

  end
end
