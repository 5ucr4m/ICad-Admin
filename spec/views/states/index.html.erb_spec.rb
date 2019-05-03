require 'rails_helper'

RSpec.describe "states/index", type: :view do
  before(:each) do
    assign(:states, [
      State.create!(
        :name => "Name",
        :abbreviation => "Abbreviation",
        :code => "Code",
        :reference => "Reference",
        :slug => "Slug"
      ),
      State.create!(
        :name => "Name",
        :abbreviation => "Abbreviation",
        :code => "Code",
        :reference => "Reference",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of states" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Abbreviation".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
