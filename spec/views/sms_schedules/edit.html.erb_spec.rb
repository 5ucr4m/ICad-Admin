# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sms_schedules/edit', type: :view do
  before(:each) do
    @sms_schedule = assign(:sms_schedule, SmsSchedule.create!(
                                            message: 'MyText',
                                            group: 1,
                                            status: 1,
                                            slug: 'MyString',
                                            company: nil
                                          ))
  end

  it 'renders the edit sms_schedule form' do
    render

    assert_select 'form[action=?][method=?]', sms_schedule_path(@sms_schedule), 'post' do
      assert_select 'textarea[name=?]', 'sms_schedule[message]'

      assert_select 'input[name=?]', 'sms_schedule[group]'

      assert_select 'input[name=?]', 'sms_schedule[status]'

      assert_select 'input[name=?]', 'sms_schedule[slug]'

      assert_select 'input[name=?]', 'sms_schedule[company_id]'
    end
  end
end
