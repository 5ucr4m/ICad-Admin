# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('individual_registrations/edit', type: :view) do
  before(:each) do
    @individual_registration = assign(:individual_registration, IndividualRegistration.create!(
      health_condition: nil,
      in_street_situation: nil,
      family_member: nil,
      sociodemographic_info: nil,
      cancel_registration: nil,
      refuse_registration: false,
      form_updated: false,
      uuid: 'MyString',
      uuid_form_origin: 'MyString',
      uuid_citizen: 'MyString',
      tp_cds_origin: 1,
      company: nil,
      slug: 'MyString'
    ))
  end

  it 'renders the edit individual_registration form' do
    render

    assert_select 'form[action=?][method=?]', individual_registration_path(@individual_registration), 'post' do
      assert_select 'input[name=?]', 'individual_registration[health_condition_id]'

      assert_select 'input[name=?]', 'individual_registration[in_street_situation_id]'

      assert_select 'input[name=?]', 'individual_registration[family_member_id]'

      assert_select 'input[name=?]', 'individual_registration[sociodemographic_info_id]'

      assert_select 'input[name=?]', 'individual_registration[cancel_registration_id]'

      assert_select 'input[name=?]', 'individual_registration[refuse_registration]'

      assert_select 'input[name=?]', 'individual_registration[form_updated]'

      assert_select 'input[name=?]', 'individual_registration[uuid]'

      assert_select 'input[name=?]', 'individual_registration[uuid_form_origin]'

      assert_select 'input[name=?]', 'individual_registration[uuid_citizen]'

      assert_select 'input[name=?]', 'individual_registration[tp_cds_origin]'

      assert_select 'input[name=?]', 'individual_registration[company_id]'

      assert_select 'input[name=?]', 'individual_registration[slug]'
    end
  end
end
