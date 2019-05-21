# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'companies/new', type: :view do
  before(:each) do
    assign(:company, Company.new(
                       legal_full_name: 'MyString',
                       fancy_name: 'MyString',
                       federal_registry: 'MyString',
                       state_registry: 'MyString',
                       patio: 'MyString',
                       number: 'MyString',
                       zip: 'MyString',
                       reference: 'MyString',
                       district: 'MyString',
                       city: nil,
                       complement: 'MyString',
                       slug: 'MyString'
                     ))
  end

  it 'renders new company form' do
    render

    assert_select 'form[action=?][method=?]', companies_path, 'post' do
      assert_select 'input[name=?]', 'company[legal_full_name]'

      assert_select 'input[name=?]', 'company[fancy_name]'

      assert_select 'input[name=?]', 'company[federal_registry]'

      assert_select 'input[name=?]', 'company[state_registry]'

      assert_select 'input[name=?]', 'company[patio]'

      assert_select 'input[name=?]', 'company[number]'

      assert_select 'input[name=?]', 'company[zip]'

      assert_select 'input[name=?]', 'company[reference]'

      assert_select 'input[name=?]', 'company[district]'

      assert_select 'input[name=?]', 'company[city_id]'

      assert_select 'input[name=?]', 'company[complement]'

      assert_select 'input[name=?]', 'company[slug]'
    end
  end
end
