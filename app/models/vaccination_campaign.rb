# frozen_string_literal: true

# == Schema Information
#
# Table name: vaccination_campaigns
#
#  id           :bigint           not null, primary key
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


class VaccinationCampaign < ApplicationRecord
  include Sluggable

  belongs_to :vaccine, optional: true
  belongs_to :company, optional: true

  validates :title, :description, :period_start, :period_end, presence: true

  ransack_alias :search, :id_to_s
end
