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

FactoryBot.define do
  factory :generic_model do
    name { "MyString" }
    description { "MyString" }
    reference { "MyString" }
    generic_field { "MyString" }
    generic_class { "MyString" }
    generic_model { nil }
    slug { "MyString" }
  end
end
