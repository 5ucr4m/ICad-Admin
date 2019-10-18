# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sms_messages/index', type: :view do
  before(:each) do
    assign(:sms_messages, [
             SmsMessage.create!(
               number: 2,
               status: 3,
               sms_schedule: nil,
               slug: 'Slug',
               company: nil
             ),
             SmsMessage.create!(
               number: 2,
               status: 3,
               sms_schedule: nil,
               slug: 'Slug',
               company: nil
             )
           ])
  end

  it 'renders a list of sms_messages' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
