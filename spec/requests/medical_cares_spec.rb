require 'rails_helper'

RSpec.describe "MedicalCares", type: :request do
  describe "GET /medical_cares" do
    it "works! (now write some real specs)" do
      get medical_cares_path
      expect(response).to have_http_status(200)
    end
  end
end
