# frozen_string_literal: true

class Role < ApplicationRecord
  include Sluggable

  REGISTRIES = [
    HealthEstablishment,
    HealthProfessional,
    ProfessionalTeam,
    Vaccine,
    PeriodItem,
    AppointmentBooking,
  ].freeze

  FORMS = [
    Family,
    FamilyMember,
    HomeRegistration,
    HomeVisitRegistration,
    IndividualRegistration,
    Vaccination,
  ].freeze

  ADMINISTRATION = [
    User,
    Company,
    City,
    Role,
    State,
  ].freeze

  CONFIGURATION = [
    Period,
    SmsSchedule,
    SmsMessage,
    VaccinationCampaign,
  ].freeze

  REPORTS = [].freeze

  has_many :user_roles
  has_many :user_companies, through: :user_roles
  has_many :companies, through: :user_companies
  has_many :users, through: :companies

  enum role_type: { admin: 0, mayor: 1, secretary: 2, doctor: 3, nurse: 4,
                    nurse_aux: 5, agent: 6, dentist: 7, dentist_aux: 8, support: 9, citizen: 10, service: 11 }

  ransack_alias :search, :id_to_s

  def name_formatted
    name.upcase
  end
end
