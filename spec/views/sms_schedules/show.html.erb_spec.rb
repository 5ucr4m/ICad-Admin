# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sms_schedules/show', type: :view do
  before(:each) do
    @sms_schedule = assign(:sms_schedule, SmsSchedule.create!(
                                            message: 'MyText',
                                            group: 2,
                                            status: 3,
                                            slug: 'Slug',
                                            company: nil
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end
