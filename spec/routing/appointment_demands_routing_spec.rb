require "rails_helper"

RSpec.describe(AppointmentDemandsController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/appointment_demands").to(route_to("appointment_demands#index"))
    end

    it "routes to #new" do
      expect(get: "/appointment_demands/new").to(route_to("appointment_demands#new"))
    end

    it "routes to #show" do
      expect(get: "/appointment_demands/1").to(route_to("appointment_demands#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/appointment_demands/1/edit").to(route_to("appointment_demands#edit", id: "1"))
    end

    it "routes to #create" do
      expect(post: "/appointment_demands").to(route_to("appointment_demands#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/appointment_demands/1").to(route_to("appointment_demands#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/appointment_demands/1").to(route_to("appointment_demands#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/appointment_demands/1").to(route_to("appointment_demands#destroy", id: "1"))
    end
  end
end
