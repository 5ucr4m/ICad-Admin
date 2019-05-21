# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthProfessionalsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/health_professionals').to route_to('health_professionals#index')
    end

    it 'routes to #new' do
      expect(get: '/health_professionals/new').to route_to('health_professionals#new')
    end

    it 'routes to #show' do
      expect(get: '/health_professionals/1').to route_to('health_professionals#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/health_professionals/1/edit').to route_to('health_professionals#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/health_professionals').to route_to('health_professionals#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/health_professionals/1').to route_to('health_professionals#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/health_professionals/1').to route_to('health_professionals#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/health_professionals/1').to route_to('health_professionals#destroy', id: '1')
    end
  end
end
