# frozen_string_literal: true

class CreateRoles < SeedMigration::Migration
  def up
    registries = [
      Family,
      FamilyMember,
      HealthEstablishment,
      HealthProfessional,
      Period,
      ProfessionalTeam,
      VaccinationCampaign,
      Vaccine
    ]
    forms = [
      HomeRegistration,
      HomeVisitForm,
      HomeVisitRegistration,
      IndividualRegistration,
      Vaccination
    ]
    reports = [
      Family,
      FamilyMember,
      HealthEstablishment,
      HealthProfessional,
      HomeRegistration,
      HomeVisitRegistration,
      IndividualRegistration,
      Period,
      ProfessionalTeam,
      VaccinationCampaign,
      Vaccination,
      Vaccine
    ]
    configuration = [
      User,
      Company
    ]
    admin = [
      City,
      Company,
      Role,
      State
    ]

    [registries, forms, reports, configuration, admin]
      .freeze.each_with_index do |m, i|
      m.each do |role|
        create_by_app_module(role, i + 1)
      end
    end
  end

  def down; end

  def create_by_app_module(role, reference)
    @manage = Role.create! name: role.to_s,
                           reference: 'manage',
                           description: role.to_s.pluralize,
                           app_module: GenericModel.find_by(generic_field: :app_module,
                                                            reference: reference)
    %w[index new create show edit update destroy].each do |action|
      Role.create! name: role.to_s,
                   description: "#{action} #{role}",
                   role: @manage,
                   url: define_route_path(role, action),
                   reference: action,
                   app_module: GenericModel.find_by(generic_field: :app_module, reference: reference)
    end
  end

  def define_route_path(role, action)
    case action
    when 'new'
      "new_#{role.to_s.camelize.underscore}_path"
    when 'index'
      "#{role.to_s.pluralize.camelize.underscore}_path"
    when 'create'
      "#{role.to_s.pluralize.camelize.underscore}_path"
    when 'show'
      "#{role.to_s.camelize.underscore}_path"
    when 'update'
      "#{role.to_s.camelize.underscore}_path"
    when 'delete'
      "#{role.to_s.camelize.underscore}_path"
    when 'edit'
      "edit_#{role.to_s.camelize.underscore}_path"
    end
  end
end
