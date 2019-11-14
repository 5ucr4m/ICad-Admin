# frozen_string_literal: true

class VaccinationCampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :period_start, :period_end, :age_initial, :age_end, :slug
  has_one :company
end
