# frozen_string_literal: true

# == Schema Information
#
# Table name: generic_models
#
#  id               :bigint           not null, primary key
#  description      :string
#  generic_class    :string
#  generic_field    :string
#  name             :string
#  reference        :string
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  generic_model_id :bigint
#
# Indexes
#
#  index_generic_models_on_generic_model_id  (generic_model_id)
#
# Foreign Keys
#
#  fk_rails_...  (generic_model_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe GenericModel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
