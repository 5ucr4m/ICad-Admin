require 'rails_helper'

RSpec.describe("AppointmentBookings", type: :request) do
  describe "GET /appointment_bookings" do
    it "works! (now write some real specs)" do
      get appointment_bookings_path
      expect(response).to(have_http_status(200))
    end
  end
end
