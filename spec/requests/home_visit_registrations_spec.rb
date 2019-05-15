require 'rails_helper'

RSpec.describe "HomeVisitRegistrations", type: :request do
  describe "GET /home_visit_registrations" do
    it "works! (now write some real specs)" do
      get home_visit_registrations_path
      expect(response).to have_http_status(200)
    end
  end
end
