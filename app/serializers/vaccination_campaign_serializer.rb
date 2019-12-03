# frozen_string_literal: true

class VaccinationCampaignSerializer < ApplicationSerializer
  attributes :id, :title, :description, :period_start, :period_end, :age_initial, :age_end
  has_one :company
end
