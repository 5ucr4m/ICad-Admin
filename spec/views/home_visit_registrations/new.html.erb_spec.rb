# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('home_visit_registrations/new', type: :view) do
  before(:each) do
    assign(:home_visit_registration, HomeVisitRegistration.new(
      family_member: nil,
      uuid: 'MyString',
      tp_cds_origin: 'MyString',
      company: nil,
      slug: 'MyString'
    ))
  end

  it 'renders new home_visit_registration form' do
    render

    assert_select 'form[action=?][method=?]', home_visit_registrations_path, 'post' do
      assert_select 'input[name=?]', 'home_visit_registration[family_member_id]'

      assert_select 'input[name=?]', 'home_visit_registration[uuid]'

      assert_select 'input[name=?]', 'home_visit_registration[tp_cds_origin]'

      assert_select 'input[name=?]', 'home_visit_registration[company_id]'

      assert_select 'input[name=?]', 'home_visit_registration[slug]'
    end
  end
end
