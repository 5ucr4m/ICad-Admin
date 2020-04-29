require "rails_helper"

RSpec.describe(AppointmentBookingsController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/appointment_bookings").to(route_to("appointment_bookings#index"))
    end

    it "routes to #new" do
      expect(get: "/appointment_bookings/new").to(route_to("appointment_bookings#new"))
    end

    it "routes to #show" do
      expect(get: "/appointment_bookings/1").to(route_to("appointment_bookings#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/appointment_bookings/1/edit").to(route_to("appointment_bookings#edit", id: "1"))
    end

    it "routes to #create" do
      expect(post: "/appointment_bookings").to(route_to("appointment_bookings#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/appointment_bookings/1").to(route_to("appointment_bookings#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/appointment_bookings/1").to(route_to("appointment_bookings#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/appointment_bookings/1").to(route_to("appointment_bookings#destroy", id: "1"))
    end
  end
end
