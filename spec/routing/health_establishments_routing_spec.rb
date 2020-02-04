# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(HealthEstablishmentsController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/health_establishments').to(route_to('health_establishments#index'))
    end

    it 'routes to #new' do
      expect(get: '/health_establishments/new').to(route_to('health_establishments#new'))
    end

    it 'routes to #show' do
      expect(get: '/health_establishments/1').to(route_to('health_establishments#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/health_establishments/1/edit').to(route_to('health_establishments#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/health_establishments').to(route_to('health_establishments#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/health_establishments/1').to(route_to('health_establishments#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/health_establishments/1').to(route_to('health_establishments#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/health_establishments/1').to(route_to('health_establishments#destroy', id: '1'))
    end
  end
end
