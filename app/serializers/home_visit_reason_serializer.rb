# frozen_string_literal: true

class HomeVisitReasonSerializer < ApplicationSerializer
  attributes :id

  has_one :home_visit_form
  has_one :reason
end
