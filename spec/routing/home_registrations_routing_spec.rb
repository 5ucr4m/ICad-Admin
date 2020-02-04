# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(HomeRegistrationsController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/home_registrations').to(route_to('home_registrations#index'))
    end

    it 'routes to #new' do
      expect(get: '/home_registrations/new').to(route_to('home_registrations#new'))
    end

    it 'routes to #show' do
      expect(get: '/home_registrations/1').to(route_to('home_registrations#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/home_registrations/1/edit').to(route_to('home_registrations#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/home_registrations').to(route_to('home_registrations#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/home_registrations/1').to(route_to('home_registrations#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/home_registrations/1').to(route_to('home_registrations#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/home_registrations/1').to(route_to('home_registrations#destroy', id: '1'))
    end
  end
end
