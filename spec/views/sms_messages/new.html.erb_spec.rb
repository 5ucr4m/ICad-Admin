# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('sms_messages/new', type: :view) do
  before(:each) do
    assign(:sms_message, SmsMessage.new(
      number: 1,
      status: 1,
      sms_schedule: nil,
      slug: 'MyString',
      company: nil
    ))
  end

  it 'renders new sms_message form' do
    render

    assert_select 'form[action=?][method=?]', sms_messages_path, 'post' do
      assert_select 'input[name=?]', 'sms_message[number]'

      assert_select 'input[name=?]', 'sms_message[status]'

      assert_select 'input[name=?]', 'sms_message[sms_schedule_id]'

      assert_select 'input[name=?]', 'sms_message[slug]'

      assert_select 'input[name=?]', 'sms_message[company_id]'
    end
  end
end
