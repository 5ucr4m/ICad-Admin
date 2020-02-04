# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('vaccinations/show', type: :view) do
  before(:each) do
    @vaccination = assign(:vaccination, Vaccination.create!(
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
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Uuid/))
    expect(rendered).to(match(/Tp Cds Origin/))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
  end
end
