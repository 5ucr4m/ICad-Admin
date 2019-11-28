# frozen_string_literal: true

# == Schema Information
#
# Table name: home_visit_forms
#
#  id                         :bigint           not null, primary key
#  birth_date                 :date
#  cns_number                 :string
#  handbook_number            :string
#  height_monitoring          :string
#  micro_area                 :string
#  other_visit                :boolean
#  out_area                   :boolean
#  slug                       :string
#  weight_monitoring          :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  company_id                 :bigint
#  gender_id                  :bigint
#  home_type_id               :bigint
#  home_visit_registration_id :bigint
#  outcome_id                 :bigint
#  turn_id                    :bigint
#
# Indexes
#
#  index_home_visit_forms_on_company_id                  (company_id)
#  index_home_visit_forms_on_gender_id                   (gender_id)
#  index_home_visit_forms_on_home_type_id                (home_type_id)
#  index_home_visit_forms_on_home_visit_registration_id  (home_visit_registration_id)
#  index_home_visit_forms_on_outcome_id                  (outcome_id)
#  index_home_visit_forms_on_turn_id                     (turn_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (gender_id => generic_models.id)
#  fk_rails_...  (home_type_id => generic_models.id)
#  fk_rails_...  (home_visit_registration_id => home_visit_registrations.id)
#  fk_rails_...  (outcome_id => generic_models.id)
#  fk_rails_...  (turn_id => generic_models.id)
#

class HomeVisitForm < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :home_visit_registration
  belongs_to :turn, class_name: 'GenericModel'
  belongs_to :gender, class_name: 'GenericModel'
  belongs_to :outcome, class_name: 'GenericModel'
  belongs_to :home_type, class_name: 'GenericModel'
  belongs_to :company, optional: true
  has_one :user, through: :home_visit_registration

  has_many :home_visit_reasons, dependent: :destroy
  has_one :family_member, through: :home_visit_registration

  accepts_nested_attributes_for :home_visit_reasons, allow_destroy: true
  accepts_nested_attributes_for :home_visit_registration, allow_destroy: false

  ransack_alias :search, :id_to_s
end
