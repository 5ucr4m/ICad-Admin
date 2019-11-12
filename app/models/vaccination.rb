# frozen_string_literal: true

class Vaccination < ApplicationRecord
  include Sluggable
  include Tenantable

  enum patient_type: %i[men woman teenage child newborn elderly]

  belongs_to :header_transport, optional: true
  belongs_to :vaccination_campaign
  belongs_to :turn, class_name: 'GenericModel'
  belongs_to :family_member
  belongs_to :local_service, class_name: 'GenericModel'
  belongs_to :company, optional: true
  belongs_to :user

  has_many :vaccination_vaccines
  has_many :vaccines, through: :vaccination_vaccines

  accepts_nested_attributes_for :vaccination_vaccines, allow_destroy: true

  ransack_alias :search, :id_to_s
end
