# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('HomeRegistrations', type: :request) do
  describe 'GET /home_registrations' do
    it 'works! (now write some real specs)' do
      get home_registrations_path
      expect(response).to(have_http_status(200))
    end
  end
end
