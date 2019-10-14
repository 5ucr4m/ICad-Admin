# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'vaccinations/edit', type: :view do
  before(:each) do
    @vaccination = assign(:vaccination, Vaccination.create!(
                                          uuid: 'MyString',
                                          tp_cds_origin: 'MyString',
                                          header_transport: nil,
                                          vaccination_campaign: nil,
                                          company: nil,
                                          slug: 'MyString'
                                        ))
  end

  it 'renders the edit vaccination form' do
    render

    assert_select 'form[action=?][method=?]', vaccination_path(@vaccination), 'post' do
      assert_select 'input[name=?]', 'vaccination[uuid]'

      assert_select 'input[name=?]', 'vaccination[tp_cds_origin]'

      assert_select 'input[name=?]', 'vaccination[header_transport_id]'

      assert_select 'input[name=?]', 'vaccination[vaccination_campaign_id]'

      assert_select 'input[name=?]', 'vaccination[company_id]'

      assert_select 'input[name=?]', 'vaccination[slug]'
    end
  end
end
