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

class HomeVisitRegistrationSerializer < ApplicationSerializer
  attributes :id, :uuid, :tp_cds_origin, :slug
  has_one :family_member
  has_one :company

  def id
    object.slug
  end
end
