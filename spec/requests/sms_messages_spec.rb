# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('SmsMessages', type: :request) do
  describe 'GET /sms_messages' do
    it 'works! (now write some real specs)' do
      get sms_messages_path
      expect(response).to(have_http_status(200))
    end
  end
end
