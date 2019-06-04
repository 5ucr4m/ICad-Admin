# == Schema Information
#
# Table name: responsible_children
#
#  id                         :bigint           not null, primary key
#  slug                       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  company_id                 :bigint
#  individual_registration_id :bigint
#  responsible_child_type_id  :bigint
#
# Indexes
#
#  index_responsible_children_on_company_id                  (company_id)
#  index_responsible_children_on_individual_registration_id  (individual_registration_id)
#  index_responsible_children_on_responsible_child_type_id   (responsible_child_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (individual_registration_id => individual_registrations.id)
#  fk_rails_...  (responsible_child_type_id => generic_models.id)
#

class ResponsibleChild < ApplicationRecord
  include Sluggable

  belongs_to :individual_registration, optional: true
  belongs_to :responsible_child_type, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
