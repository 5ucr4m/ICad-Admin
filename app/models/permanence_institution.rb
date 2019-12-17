# frozen_string_literal: true

# == Schema Information
#
# Table name: permanence_institutions
#
#  id                         :bigint           not null, primary key
#  institutional_role         :string
#  name                       :string
#  other_linked_professionals :boolean
#  responsible_cns            :string
#  responsible_name           :string
#  responsible_phone          :string
#  slug                       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  company_id                 :bigint
#
# Indexes
#
#  index_permanence_institutions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class PermanenceInstitution < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :company, optional: true

  has_one :home_registration, dependent: :destroy

  ransack_alias :search, :id_to_s
end
