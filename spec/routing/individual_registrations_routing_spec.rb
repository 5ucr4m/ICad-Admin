# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndividualRegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/individual_registrations').to route_to('individual_registrations#index')
    end

    it 'routes to #new' do
      expect(get: '/individual_registrations/new').to route_to('individual_registrations#new')
    end

    it 'routes to #show' do
      expect(get: '/individual_registrations/1').to route_to('individual_registrations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/individual_registrations/1/edit').to route_to('individual_registrations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/individual_registrations').to route_to('individual_registrations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/individual_registrations/1').to route_to('individual_registrations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/individual_registrations/1').to route_to('individual_registrations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/individual_registrations/1').to route_to('individual_registrations#destroy', id: '1')
    end
  end
end
