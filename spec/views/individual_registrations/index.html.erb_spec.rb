# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('individual_registrations/index', type: :view) do
  before(:each) do
    assign(:individual_registrations, [
      IndividualRegistration.create!(
        health_condition: nil,
        in_street_situation: nil,
        family_member: nil,
        sociodemographic_info: nil,
        cancel_registration: nil,
        refuse_registration: false,
        form_updated: false,
        uuid: 'Uuid',
        uuid_form_origin: 'Uuid Form Origin',
        uuid_citizen: 'Uuid Citizen',
        tp_cds_origin: 2,
        company: nil,
        slug: 'Slug'
      ),
      IndividualRegistration.create!(
        health_condition: nil,
        in_street_situation: nil,
        family_member: nil,
        sociodemographic_info: nil,
        cancel_registration: nil,
        refuse_registration: false,
        form_updated: false,
        uuid: 'Uuid',
        uuid_form_origin: 'Uuid Form Origin',
        uuid_citizen: 'Uuid Citizen',
        tp_cds_origin: 2,
        company: nil,
        slug: 'Slug'
      ),
    ])
  end

  it 'renders a list of individual_registrations' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 'Uuid'.to_s, count: 2
    assert_select 'tr>td', text: 'Uuid Form Origin'.to_s, count: 2
    assert_select 'tr>td', text: 'Uuid Citizen'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
