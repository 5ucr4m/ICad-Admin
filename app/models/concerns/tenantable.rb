# frozen_string_literal: true

module Tenantable
  extend ActiveSupport::Concern

  included do
    include RailsMultitenant::MultitenantModel
    multitenant_on :company_id
  end
end
