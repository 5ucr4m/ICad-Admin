# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('IndividualRegistrations', type: :request) do
  describe 'GET /individual_registrations' do
    it 'works! (now write some real specs)' do
      get individual_registrations_path
      expect(response).to(have_http_status(200))
    end
  end
end
