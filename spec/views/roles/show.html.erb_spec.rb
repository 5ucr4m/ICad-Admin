# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'roles/show', type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
                            name: 'Name',
                            description: 'Description',
                            icon: 'Icon',
                            reference: 'Reference',
                            role: nil,
                            app_module: nil,
                            slug: 'Slug'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
