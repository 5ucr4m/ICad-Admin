# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('VaccinationCampaigns', type: :request) do
  describe 'GET /vaccination_campaigns' do
    it 'works! (now write some real specs)' do
      get vaccination_campaigns_path
      expect(response).to(have_http_status(200))
    end
  end
end
