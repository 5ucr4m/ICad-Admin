# frozen_string_literal: true

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

class VaccinationCampaign < ApplicationRecord
  include Sluggable

  belongs_to :vaccine, optional: true
  belongs_to :company, optional: true

  validates :title, :description, :period_start,
            :period_end, :age_initial, :age_end, presence: true

  validates :age_initial, :age_end, numericality: {greater_than_or_equal_to: 0.0}

  ransacker :period_start_to_s do
    Arel.sql("DATE(#{table_name}.period_start)")
  end

  ransacker :period_end_to_s do
    Arel.sql("DATE(#{table_name}.period_end)")
  end

  ransacker :age_start_to_s do
    Arel.sql("DATE(#{table_name}.age_start)")
  end

  ransacker :age_end_to_s do
    Arel.sql("DATE(#{table_name}.age_end)")
  end

  ransack_alias :search, :id_to_s_or_title_or_description
end
