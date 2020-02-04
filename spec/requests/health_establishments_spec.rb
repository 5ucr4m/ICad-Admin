# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('HealthEstablishments', type: :request) do
  describe 'GET /health_establishments' do
    it 'works! (now write some real specs)' do
      get health_establishments_path
      expect(response).to(have_http_status(200))
    end
  end
end
