# frozen_string_literal: true

# == Schema Information
#
# Table name: home_visit_registrations
#
#  id               :bigint           not null, primary key
#  slug             :string
#  tp_cds_origin    :string
#  uuid             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id       :bigint
#  family_member_id :bigint
#
# Indexes
#
#  index_home_visit_registrations_on_company_id        (company_id)
#  index_home_visit_registrations_on_family_member_id  (family_member_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_member_id => family_members.id)
#

class HomeVisitRegistration < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :family_member
  belongs_to :company, optional: true
  belongs_to :user

  has_many :home_visit_forms, dependent: :destroy

  has_one :period_item, as: :registrable, dependent: :destroy

  accepts_nested_attributes_for :family_member, allow_destroy: false
  accepts_nested_attributes_for :home_visit_forms, allow_destroy: true

  ransack_alias :search, :id_to_s

  before_validation :set_user

  def build_relation_ships
    build_family_member
  end

  private

  def set_user
    return if user.blank?
    return if family_member.blank?
    return unless family_member&.user&.blank?

    self.family_member.user = user
  end
end
