# frozen_string_literal: true

class CreateAppModules < SeedMigration::Migration
  def up
    @app_modules = GenericModel.create! name: 'Modulos do Sistema',
                                        description: 'Módulos Principais do Sistema',
                                        reference: 0, generic_field: :app_module, generic_class: 'Role'
    GenericModel.create! name: 'Configuração',
                         description: 'Módulo de Configuração',
                         reference: 1, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules
  end

  def down; end
end
