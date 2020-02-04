# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('home_visit_registrations/show', type: :view) do
  before(:each) do
    @home_visit_registration = assign(:home_visit_registration, HomeVisitRegistration.create!(
      family_member: nil,
      uuid: 'Uuid',
      tp_cds_origin: 'Tp Cds Origin',
      company: nil,
      slug: 'Slug'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Uuid/))
    expect(rendered).to(match(/Tp Cds Origin/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
  end
end
