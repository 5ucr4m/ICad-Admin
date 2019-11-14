# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vaccinations/index', type: :view do
  before(:each) do
    assign(:vaccinations, [
             Vaccination.create!(
               uuid: 'Uuid',
               tp_cds_origin: 'Tp Cds Origin',
               patient_type: 2,
               header_transport: nil,
               vaccination_campaign: nil,
               turn: nil,
               family_member: nil,
               local_service: nil,
               traveller: false,
               leprosy_communicant: false,
               pregnant: false,
               puerperal: false,
               company: nil,
               slug: 'Slug'
             ),
             Vaccination.create!(
               uuid: 'Uuid',
               tp_cds_origin: 'Tp Cds Origin',
               patient_type: 2,
               header_transport: nil,
               vaccination_campaign: nil,
               turn: nil,
               family_member: nil,
               local_service: nil,
               traveller: false,
               leprosy_communicant: false,
               pregnant: false,
               puerperal: false,
               company: nil,
               slug: 'Slug'
             )
           ])
  end

  it 'renders a list of vaccinations' do
    render
    assert_select 'tr>td', text: 'Uuid'.to_s, count: 2
    assert_select 'tr>td', text: 'Tp Cds Origin'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
