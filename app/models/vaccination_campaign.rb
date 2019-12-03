# frozen_string_literal: true

class VaccinationCampaign < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :company, optional: true

  has_many :vaccinations

  validates :title, :description, :period_start,
            :period_end, :age_initial, :age_end, presence: true

  validates :age_initial, :age_end, numericality: { greater_than_or_equal_to: 0.0 }

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

  scope :active_campaigns, -> { where('period_end <= ?', Time.current) }
end
