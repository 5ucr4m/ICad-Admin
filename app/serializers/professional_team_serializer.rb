# frozen_string_literal: true

class ProfessionalTeamSerializer < ApplicationSerializer
  attributes :id, :name, :code, :active, :slug
  has_one :health_establishment
  has_one :company

  def id
    object.slug
  end
end
