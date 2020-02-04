# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('home_registrations/edit', type: :view) do
  before(:each) do
    @home_registration = assign(:home_registration, HomeRegistration.create!(
      location_x: 'MyString',
      location_y: 'MyString',
      health_professional: nil,
      living_condition: nil,
      address: nil,
      form_updated: false,
      pet_quantity: 1,
      refuse_registration: false,
      tp_cds_origin: 1,
      uuid: 'MyString',
      uuid_form_origin: 'MyString',
      home_type: nil,
      permanence_institution: nil,
      finished: false,
      company: nil,
      slug: 'MyString'
    ))
  end

  it 'renders the edit home_registration form' do
    render

    assert_select 'form[action=?][method=?]', home_registration_path(@home_registration), 'post' do
      assert_select 'input[name=?]', 'home_registration[location_x]'

      assert_select 'input[name=?]', 'home_registration[location_y]'

      assert_select 'input[name=?]', 'home_registration[health_professional_id]'

      assert_select 'input[name=?]', 'home_registration[living_condition_id]'

      assert_select 'input[name=?]', 'home_registration[address_id]'

      assert_select 'input[name=?]', 'home_registration[form_updated]'

      assert_select 'input[name=?]', 'home_registration[pet_quantity]'

      assert_select 'input[name=?]', 'home_registration[refuse_registration]'

      assert_select 'input[name=?]', 'home_registration[tp_cds_origin]'

      assert_select 'input[name=?]', 'home_registration[uuid]'

      assert_select 'input[name=?]', 'home_registration[uuid_form_origin]'

      assert_select 'input[name=?]', 'home_registration[home_type_id]'

      assert_select 'input[name=?]', 'home_registration[permanence_institution_id]'

      assert_select 'input[name=?]', 'home_registration[finished]'

      assert_select 'input[name=?]', 'home_registration[company_id]'

      assert_select 'input[name=?]', 'home_registration[slug]'
    end
  end
end
