require 'rails_helper'

RSpec.describe "roles/show", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      :name => "Name",
      :description => "Description",
      :icon => "Icon",
      :model_reference => "Model Reference",
      :action_reference => "Action Reference",
      :url_reference => "Url Reference",
      :role => nil,
      :app_module => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/Model Reference/)
    expect(rendered).to match(/Action Reference/)
    expect(rendered).to match(/Url Reference/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
