require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :registry => nil,
        :slug => "Slug"
      ),
      Company.create!(
        :registry => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
