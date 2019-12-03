# frozen_string_literal: true

class VaccinationSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  attributes :id, :uuid, :tp_cds_origin, :patient_type, :traveller,
             :leprosy_communicant, :pregnant, :puerperal,
             :initial_date_hour, :final_date_hour, :lng, :lat, :url,
             :name, :gender, :age, :vaccinated
  has_one :header_transport
  has_one :vaccination_campaign
  has_one :turn
  has_one :family_member
  has_one :local_service
  has_one :company

  def lng
    object.family_member.location_x
  end

  def lat
    object.family_member.location_y
  end

  def patient_type
    Vaccination.patient_types[object.patient_type]
  end

  def name
    object.family_member.name
  end

  def gender
    object.family_member.gender.name_formatted
  end

  def age
    distance_of_time_in_words object.family_member.birth_date, Time.current.to_date, only: :months
  end

  def url
    family_member_url(object.family_member, only_path: true)
  end

  def vaccinated
    object.initial_date_hour.blank?
  end
end
