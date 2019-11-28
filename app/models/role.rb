# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  REGISTRIES = [
    HealthEstablishment,
    HealthProfessional,
    ProfessionalTeam,
    VaccinationCampaign,
    Vaccine,
    Period
  ].freeze

  AGENT_FORMS = [
    Family,
    FamilyMember,
    HomeRegistration,
    HomeVisitRegistration,
    IndividualRegistration
  ].freeze

  OTHER_FORMS = [
    Vaccination
  ].freeze

  REPORTS = [
    PeriodItem
  ].freeze

  AGENT_REPORTS = [
    PeriodItem
  ].freeze

  ADMIN_CONFIGURATION = [
    User,
    Company,
    City,
    Role,
    State
  ].freeze

  USER_CONFIGURATION = [
    User
  ].freeze

  ADMIN_SUPPORT = [
    SmsSchedule,
    SmsMessage
  ].freeze

  has_many :user_roles
  has_many :user_companies, through: :user_roles
  has_many :companies, through: :user_companies
  has_many :users, through: :companies
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  enum role_type: %i[admin mayor secretary doctor nurse nurse_aux agent dentist dentist_aux support]

  ransack_alias :search, :id_to_s

  def name_formatted
    name.upcase
  end
end
