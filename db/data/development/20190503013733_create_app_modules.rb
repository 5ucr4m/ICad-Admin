# frozen_string_literal: true

class CreateAppModules < SeedMigration::Migration
  def up
    @app_modules = GenericModel.create! name: 'Modulos do Sistema',
                                        description: 'Módulos Principais do Sistema',
                                        reference: 0, generic_field: :app_module, generic_class: 'Role'
    GenericModel.create! name: '<i class="fas fa-file-signature mr-2"></i>Cadastros',
                         description: 'Módulo de Cadastros',
                         reference: 1, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules

    GenericModel.create! name: '<i class="fas fa-folder-open mr-2"></i>Fichas',
                         description: 'Módulo de Fichas',
                         reference: 2, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules

    GenericModel.create! name: '<i class="fas fa-chart-bar mr-2"></i>Relatórios',
                         description: 'Módulo de Relatórios',
                         reference: 3, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules

    GenericModel.create! name: '<i class="fas fa-cogs mr-2"></i>Configuração',
                         description: 'Módulo de Configuração',
                         reference: 4, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules

    GenericModel.create! name: '<i class="fas fa-lock mr-2"></i>Administração',
                         description: 'Módulo de Administração',
                         reference: 5, generic_field: :app_module,
                         generic_class: 'Role', generic_model: @app_modules
  end

  def down; end
end
