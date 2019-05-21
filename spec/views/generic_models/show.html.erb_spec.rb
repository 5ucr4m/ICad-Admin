# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'generic_models/show', type: :view do
  before(:each) do
    @generic_model = assign(:generic_model, GenericModel.create!(
                                              name: 'Name',
                                              description: 'Description',
                                              reference: 'Reference',
                                              generic_field: 'Generic Field',
                                              generic_class: 'Generic Class',
                                              generic_model: nil,
                                              slug: 'Slug'
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Generic Field/)
    expect(rendered).to match(/Generic Class/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
