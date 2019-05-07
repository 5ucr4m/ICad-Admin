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

class GenericModel < ApplicationRecord
  include Sluggable

  belongs_to :generic_model, optional: true

  ransack_alias :search, :id_to_s

  scope :app_modules, -> { where(generic_class: Role.to_s, generic_field: :app_module) }
end
