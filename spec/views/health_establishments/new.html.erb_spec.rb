# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'health_establishments/new', type: :view do
  before(:each) do
    assign(:health_establishment, HealthEstablishment.new(
                                    cnes_code: 'MyString',
                                    unit_code: 'MyString',
                                    legal_full_name: 'MyString',
                                    fancy_name: 'MyString',
                                    federal_registry: 'MyString',
                                    state_registry: 'MyString',
                                    manager_full_name: 'MyString',
                                    manager_federal_registry: 'MyString',
                                    unit_type: nil,
                                    company: nil,
                                    slug: 'MyString'
                                  ))
  end

  it 'renders new health_establishment form' do
    render

    assert_select 'form[action=?][method=?]', health_establishments_path, 'post' do
      assert_select 'input[name=?]', 'health_establishment[cnes_code]'

      assert_select 'input[name=?]', 'health_establishment[unit_code]'

      assert_select 'input[name=?]', 'health_establishment[legal_full_name]'

      assert_select 'input[name=?]', 'health_establishment[fancy_name]'

      assert_select 'input[name=?]', 'health_establishment[federal_registry]'

      assert_select 'input[name=?]', 'health_establishment[state_registry]'

      assert_select 'input[name=?]', 'health_establishment[manager_full_name]'

      assert_select 'input[name=?]', 'health_establishment[manager_federal_registry]'

      assert_select 'input[name=?]', 'health_establishment[unit_type_id]'

      assert_select 'input[name=?]', 'health_establishment[company_id]'

      assert_select 'input[name=?]', 'health_establishment[slug]'
    end
  end
end
