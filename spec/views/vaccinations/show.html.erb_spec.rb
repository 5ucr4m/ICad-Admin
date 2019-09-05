# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vaccinations/show', type: :view do
  before(:each) do
    @vaccination = assign(:vaccination, Vaccination.create!(
                                          uuid: 'Uuid',
                                          tp_cds_origin: 2,
                                          vaccination_campaign: nil,
                                          company: nil,
                                          slug: 'Slug'
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
