# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sms_messages/show', type: :view do
  before(:each) do
    @sms_message = assign(:sms_message, SmsMessage.create!(
                                          number: 2,
                                          status: 3,
                                          sms_schedule: nil,
                                          slug: 'Slug',
                                          company: nil
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end
