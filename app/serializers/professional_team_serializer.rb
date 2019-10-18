# frozen_string_literal: true

class ProfessionalTeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :active, :slug
  has_one :health_establishment
  has_one :company
end
