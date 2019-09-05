# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home_registrations/index', type: :view do
  before(:each) do
    assign(:home_registrations, [
             HomeRegistration.create!(
               location_x: 'Location X',
               location_y: 'Location Y',
               health_professional: nil,
               living_condition: nil,
               address: nil,
               form_updated: false,
               pet_quantity: 2,
               refuse_registration: false,
               tp_cds_origin: 3,
               uuid: 'Uuid',
               uuid_form_origin: 'Uuid Form Origin',
               home_type: nil,
               permanence_institution: nil,
               finished: false,
               company: nil,
               slug: 'Slug'
             ),
             HomeRegistration.create!(
               location_x: 'Location X',
               location_y: 'Location Y',
               health_professional: nil,
               living_condition: nil,
               address: nil,
               form_updated: false,
               pet_quantity: 2,
               refuse_registration: false,
               tp_cds_origin: 3,
               uuid: 'Uuid',
               uuid_form_origin: 'Uuid Form Origin',
               home_type: nil,
               permanence_institution: nil,
               finished: false,
               company: nil,
               slug: 'Slug'
             )
           ])
  end

  it 'renders a list of home_registrations' do
    render
    assert_select 'tr>td', text: 'Location X'.to_s, count: 2
    assert_select 'tr>td', text: 'Location Y'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Uuid'.to_s, count: 2
    assert_select 'tr>td', text: 'Uuid Form Origin'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
