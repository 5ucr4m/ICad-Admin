# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'families/new', type: :view do
  before(:each) do
    assign(:family, Family.new(
                      home_registration: nil,
                      responsible_cns_number: 'MyString',
                      members_quantity: 1,
                      handbook_number: 'MyString',
                      family_income_id: 1,
                      moving: false,
                      company: nil,
                      slug: 'MyString'
                    ))
  end

  it 'renders new family form' do
    render

    assert_select 'form[action=?][method=?]', families_path, 'post' do
      assert_select 'input[name=?]', 'family[home_registration_id]'

      assert_select 'input[name=?]', 'family[responsible_cns_number]'

      assert_select 'input[name=?]', 'family[members_quantity]'

      assert_select 'input[name=?]', 'family[handbook_number]'

      assert_select 'select[name=?]', 'family[family_income_id]'

      assert_select 'input[name=?]', 'family[moving]'

      assert_select 'input[name=?]', 'family[company_id]'

      assert_select 'input[name=?]', 'family[slug]'
    end
  end
end
