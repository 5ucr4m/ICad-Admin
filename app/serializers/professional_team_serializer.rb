# frozen_string_literal: true

class ProfessionalTeamSerializer < ApplicationSerializer
  attributes :id, :name, :code, :active
  has_one :health_establishment
  has_one :company
end
