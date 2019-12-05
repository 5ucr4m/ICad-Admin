# frozen_string_literal: true

class HomeVisitFormSerializer < ApplicationSerializer
  attributes :id, :turn_id,
             :handbook_number,
             :cns_number,
             :birth_date,
             :gender_id,
             :other_visit,
             :outcome_id,
             :micro_area,
             :out_area,
             :home_type_id,
             :weight_monitoring,
             :height_monitoring

  has_one :home_visit_registration
  has_many :home_visit_reasons
end
