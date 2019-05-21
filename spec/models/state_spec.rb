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

require 'rails_helper'

RSpec.describe State, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
