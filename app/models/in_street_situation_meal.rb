# frozen_string_literal: true

# == Schema Information
#
# Table name: in_street_situation_meals
#
#  id                     :bigint           not null, primary key
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint
#  in_street_situation_id :bigint
#  meal_origin_type_id    :bigint
#
# Indexes
#
#  index_in_street_situation_meals_on_company_id              (company_id)
#  index_in_street_situation_meals_on_in_street_situation_id  (in_street_situation_id)
#  index_in_street_situation_meals_on_meal_origin_type_id     (meal_origin_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (in_street_situation_id => in_street_situations.id)
#  fk_rails_...  (meal_origin_type_id => generic_models.id)
#

class InStreetSituationMeal < ApplicationRecord
  include Sluggable

  belongs_to :in_street_situation, optional: true
  belongs_to :meal_origin_type, class_name: 'GenericModel'
  belongs_to :company

  ransack_alias :search, :id_to_s
end
