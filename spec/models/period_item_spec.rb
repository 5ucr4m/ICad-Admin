# frozen_string_literal: true

# == Schema Information
#
# Table name: period_items
#
#  id                       :bigint           not null, primary key
#  app_version              :string
#  ibge_code                :string
#  lot_number               :string
#  origin_counter_key       :string
#  origin_database_name     :string
#  origin_email             :string
#  origin_federal_registry  :string
#  origin_installation_uuid :string
#  origin_legal_name        :string
#  origin_phone             :string
#  origin_software_version  :string
#  registrable_type         :string
#  sender_counter_key       :string
#  sender_database_name     :string
#  sender_email             :string
#  sender_federal_registry  :string
#  sender_installation_uuid :string
#  sender_legal_name        :string
#  sender_phone             :string
#  sender_software_version  :string
#  serialized_cnes          :string
#  serialized_ine           :string
#  serialized_uuid          :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  period_id                :bigint
#  registrable_id           :bigint
#  serialized_type_id       :bigint
#
# Indexes
#
#  index_period_items_on_period_id                            (period_id)
#  index_period_items_on_registrable_type_and_registrable_id  (registrable_type,registrable_id)
#  index_period_items_on_serialized_type_id                   (serialized_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (period_id => periods.id)
#  fk_rails_...  (serialized_type_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe PeriodItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
