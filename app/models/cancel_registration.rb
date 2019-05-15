# == Schema Information
#
# Table name: cancel_registrations
#
#  id             :bigint           not null, primary key
#  decease_date   :date
#  decease_number :date
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint
#  left_reason_id :bigint
#
# Indexes
#
#  index_cancel_registrations_on_company_id      (company_id)
#  index_cancel_registrations_on_left_reason_id  (left_reason_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (left_reason_id => generic_models.id)
#

class CancelRegistration < ApplicationRecord

  belongs_to :left_reason, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
