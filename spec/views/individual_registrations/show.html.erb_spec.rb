# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'individual_registrations/show', type: :view do
  before(:each) do
    @individual_registration = assign(:individual_registration, IndividualRegistration.create!(
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
                                                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Uuid Form Origin/)
    expect(rendered).to match(/Uuid Citizen/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
