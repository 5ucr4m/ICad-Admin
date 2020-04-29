# frozen_string_literal: true

class Vaccination < ApplicationRecord
  include Sluggable
  include Tenantable

  enum patient_type: { men: 0, woman: 1, teenage: 2, child: 3, newborn: 4, elderly: 5 }

  belongs_to :header_transport, optional: true
  belongs_to :vaccination_campaign
  belongs_to :turn, class_name: 'GenericModel'
  belongs_to :family_member
  belongs_to :local_service, class_name: 'GenericModel'
  belongs_to :way_administration, class_name: 'GenericModel'
  belongs_to :local_application, class_name: 'GenericModel'
  belongs_to :company, optional: true
  belongs_to :user

  has_many :vaccination_vaccines
  has_many :vaccines, through: :vaccination_vaccines

  accepts_nested_attributes_for :vaccination_vaccines, allow_destroy: true

  ransack_alias :search, :id_to_s

  before_validation :set_user

  private

  def set_user
    return if user.blank?
    return if family_member.blank?
    return unless family_member&.user&.blank?

    family_member.user = user
  end
end
