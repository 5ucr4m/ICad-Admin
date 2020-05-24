# frozen_string_literal: true

class HealthProfessionalSerializer < ApplicationSerializer
  attributes :id, :cns_code, :full_name, :federal_registry, :state_registry
  has_one :cbo_code
  has_one :professional_team
  has_one :user
  has_many :home_visit_registrations
  has_many :home_visit_forms
  has_many :home_registrations
  has_many :individual_registrations
  has_many :vaccinations
  has_many :families
  has_many :period_items
end
