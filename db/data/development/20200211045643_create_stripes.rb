class CreateStripes < SeedMigration::Migration
  def up
    GenericModel.create(name: 'Tarja Vermelha'.mb_chars.upcase, reference: 1, generic_field: :stripe, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Tarja Vermelha sob restrição'.mb_chars.upcase, reference: 2, generic_field: :stripe, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Venda Livre'.mb_chars.upcase, reference: 3, generic_field: :stripe, generic_class: Medicine.model_name.name)
    GenericModel.create(name: 'Tarja Preta'.mb_chars.upcase, reference: 4, generic_field: :stripe, generic_class: Medicine.model_name.name)
  end

  def down
  end
end
