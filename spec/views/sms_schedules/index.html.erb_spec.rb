# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sms_schedules/index', type: :view do
  before(:each) do
    assign(:sms_schedules, [
             SmsSchedule.create!(
               message: 'MyText',
               group: 2,
               status: 3,
               slug: 'Slug',
               company: nil
             ),
             SmsSchedule.create!(
               message: 'MyText',
               group: 2,
               status: 3,
               slug: 'Slug',
               company: nil
             )
           ])
  end

  it 'renders a list of sms_schedules' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
