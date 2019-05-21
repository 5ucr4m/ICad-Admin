# frozen_string_literal: true

# == Schema Information
#
# Table name: states
#
#  id           :bigint           not null, primary key
#  name         :string
#  abbreviation :string
#  code         :string
#  reference    :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :state do
    name { 'MyString' }
    abbreviation { 'MyString' }
    code { 'MyString' }
    reference { 'MyString' }
    slug { 'MyString' }
  end
end
