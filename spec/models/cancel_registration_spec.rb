# frozen_string_literal: true

# == Schema Information
#
# Table name: cancel_registrations
#
#  id             :bigint           not null, primary key
#  decease_date   :date
#  decease_number :string
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

require 'rails_helper'

RSpec.describe(CancelRegistration, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
