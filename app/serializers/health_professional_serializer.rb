# frozen_string_literal: true

class HealthProfessionalSerializer < ApplicationSerializer
  attributes :id, :cns_code, :full_name, :federal_registry, :state_registry
  has_one :cbo_code
  has_one :professional_team
  has_one :company
end
