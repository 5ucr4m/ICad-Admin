# frozen_string_literal: true

class CreateNationalityTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Brasileira'.mb_chars.upcase, reference: 1, generic_field: :nationality, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Naturalizado'.mb_chars.upcase, reference: 2, generic_field: :nationality, generic_class: FamilyMember.model_name.name)
    GenericModel.create!(name: 'Estrangeiro'.mb_chars.upcase, reference: 3, generic_field: :nationality, generic_class: FamilyMember.model_name.name)
  end

  def down; end
end
