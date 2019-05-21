# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'health_professionals/new', type: :view do
  before(:each) do
    assign(:health_professional, HealthProfessional.new(
                                   cns_code: 'MyString',
                                   cbo_code: nil,
                                   legal_full_name: 'MyString',
                                   fancy_name: 'MyString',
                                   federal_registry: 'MyString',
                                   state_registry: 'MyString',
                                   health_establishment: nil,
                                   professional_team: nil,
                                   company: nil,
                                   slug: 'MyString'
                                 ))
  end

  it 'renders new health_professional form' do
    render

    assert_select 'form[action=?][method=?]', health_professionals_path, 'post' do
      assert_select 'input[name=?]', 'health_professional[cns_code]'

      assert_select 'input[name=?]', 'health_professional[cbo_code_id]'

      assert_select 'input[name=?]', 'health_professional[legal_full_name]'

      assert_select 'input[name=?]', 'health_professional[fancy_name]'

      assert_select 'input[name=?]', 'health_professional[federal_registry]'

      assert_select 'input[name=?]', 'health_professional[state_registry]'

      assert_select 'input[name=?]', 'health_professional[health_establishment_id]'

      assert_select 'input[name=?]', 'health_professional[professional_team_id]'

      assert_select 'input[name=?]', 'health_professional[company_id]'

      assert_select 'input[name=?]', 'health_professional[slug]'
    end
  end
end
