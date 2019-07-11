# == Schema Information
#
# Table name: vaccination_campaigns
#
#  id           :bigint           not null, primary key
#  age_end      :integer
#  age_initial  :integer
#  child        :boolean
#  description  :text
#  period_end   :date
#  period_start :date
#  slug         :string
#  title        :string
#  woman        :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint
#  vaccine_id   :bigint
#
# Indexes
#
#  index_vaccination_campaigns_on_company_id  (company_id)
#  index_vaccination_campaigns_on_vaccine_id  (vaccine_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (vaccine_id => vaccines.id)
#

class VaccinationCampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :child, :woman, :period_start, :period_end, :age_initial, :age_end, :slug
  has_one :vaccine
  has_one :company
end
