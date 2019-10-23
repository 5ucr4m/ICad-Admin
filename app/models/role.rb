# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  REGISTRIES = [
    Family,
    FamilyMember,
    HealthEstablishment,
    HealthProfessional,
    Period,
    ProfessionalTeam,
    VaccinationCampaign,
    Vaccine
  ].freeze
  FORMS = [
    HomeRegistration,
    HomeVisitForm,
    HomeVisitRegistration,
    IndividualRegistration,
    Vaccination
  ].freeze
  REPORTS = [
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
  ].freeze
  CONFIGURATION = [
    User,
    Company
  ].freeze
  ADMIN = [
    City,
    Company,
    Role,
    State
  ].freeze

  has_many :user_roles
  has_many :user_companies, through: :user_roles
  has_many :companies, through: :user_companies
  has_many :users, through: :companies
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  enum role_type: %i[admin mayor secretary doctor nurse nurse_aux agent dentist dentist_aux]

  ransack_alias :search, :id_to_s

  def name_formatted
    name.upcase
  end

  protected
end
