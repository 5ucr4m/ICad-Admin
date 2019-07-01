require 'rails_helper'

RSpec.describe "Vaccines", type: :request do
  describe "GET /vaccines" do
    it "works! (now write some real specs)" do
      get vaccines_path
      expect(response).to have_http_status(200)
    end
  end
end
