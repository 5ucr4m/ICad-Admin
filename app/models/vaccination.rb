# == Schema Information
#
# Table name: vaccinations
#
#  id                      :bigint           not null, primary key
#  slug                    :string
#  tp_cds_origin           :integer
#  uuid                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
#  vaccination_campaign_id :bigint
#
# Indexes
#
#  index_vaccinations_on_company_id               (company_id)
#  index_vaccinations_on_vaccination_campaign_id  (vaccination_campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (vaccination_campaign_id => vaccination_campaigns.id)
#

class Vaccination < ApplicationRecord
  include Sluggable

  belongs_to :vaccination_campaign
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
