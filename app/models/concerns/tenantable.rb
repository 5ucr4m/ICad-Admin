# frozen_string_literal: true

module Tenantable
  extend ActiveSupport::Concern

  included do
    include Discard::Model
    include RailsMultitenant::MultitenantModel
    multitenant_on :company_id
    default_scope -> { kept }
    has_paper_trail
  end
end
