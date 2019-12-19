# frozen_string_literal: true

# == Schema Information
#
# Table name: individual_registrations
#
#  id                       :bigint           not null, primary key
#  final_date_hour          :datetime
#  form_updated             :boolean
#  initial_date_hour        :datetime
#  refuse_registration      :boolean
#  slug                     :string
#  tp_cds_origin            :integer
#  uuid                     :string
#  uuid_citizen             :string
#  uuid_form_origin         :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  cancel_registration_id   :bigint
#  company_id               :bigint
#  family_member_id         :bigint
#  health_condition_id      :bigint
#  in_street_situation_id   :bigint
#  sociodemographic_info_id :bigint
#
# Indexes
#
#  index_individual_registrations_on_cancel_registration_id    (cancel_registration_id)
#  index_individual_registrations_on_company_id                (company_id)
#  index_individual_registrations_on_family_member_id          (family_member_id)
#  index_individual_registrations_on_health_condition_id       (health_condition_id)
#  index_individual_registrations_on_in_street_situation_id    (in_street_situation_id)
#  index_individual_registrations_on_sociodemographic_info_id  (sociodemographic_info_id)
#
# Foreign Keys
#
#  fk_rails_...  (cancel_registration_id => cancel_registrations.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_member_id => family_members.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#  fk_rails_...  (in_street_situation_id => in_street_situations.id)
#  fk_rails_...  (sociodemographic_info_id => sociodemographic_infos.id)
#

class IndividualRegistration < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :health_condition, optional: true
  belongs_to :in_street_situation, optional: true
  belongs_to :family_member
  belongs_to :sociodemographic_info, optional: true
  belongs_to :cancel_registration, optional: true
  belongs_to :company, optional: true
  belongs_to :user

  has_one :period_item, as: :registrable, dependent: :destroy
  has_one :responsible_child

  accepts_nested_attributes_for :family_member, allow_destroy: false, reject_if: :all_blank
  accepts_nested_attributes_for :health_condition, allow_destroy: false, reject_if: :all_blank
  accepts_nested_attributes_for :in_street_situation, allow_destroy: false, reject_if: :all_blank
  accepts_nested_attributes_for :sociodemographic_info, allow_destroy: false, reject_if: :all_blank
  accepts_nested_attributes_for :cancel_registration, allow_destroy: false, reject_if: :all_blank
  accepts_nested_attributes_for :responsible_child, allow_destroy: false, reject_if: :all_blank

  ransack_alias :search, :id_to_s_or_family_member_legal_full_name_or_family_member_federal_registry

  before_validation :set_user

  amoeba do
    customize(lambda { |orig, dup|
      uuid = SecureRandom.uuid
      dup.uuid = uuid
      dup.uuid_form_origin = orig.uuid
      dup.slug = uuid.delete('-')
    })
    set service_at: nil
    exclude_association :period_item
  end

  def build_relationships
    build_health_condition if health_condition.blank?
    build_family_member if family_member.blank?
    build_in_street_situation if in_street_situation.blank?
    build_sociodemographic_info if sociodemographic_info.blank?
    build_cancel_registration if cancel_registration.blank?
  end

  def dup_individual_registration
    ir = amoeba_dup
    ir.health_condition = health_condition.amoeba_dup
    ir.in_street_situation = in_street_situation.amoeba_dup
    ir.sociodemographic_info = sociodemographic_info.amoeba_dup
    health_condition.discard
    in_street_situation.discard
    sociodemographic_info.discard
    if cancel_registration.present?
      ir.cancel_registration = cancel_registration.amoeba_dup
      cancel_registration.discard
    end
    ir.save
    update(uuid_form_update: ir.uuid)
    discard
    ir
  end

  private

  def set_user
    return if user.blank? || family_member.blank?
    return unless family_member&.user.blank?

    family_member.user = user
  end
end
