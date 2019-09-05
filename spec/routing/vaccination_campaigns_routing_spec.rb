# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VaccinationCampaignsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/vaccination_campaigns').to route_to('vaccination_campaigns#index')
    end

    it 'routes to #new' do
      expect(get: '/vaccination_campaigns/new').to route_to('vaccination_campaigns#new')
    end

    it 'routes to #show' do
      expect(get: '/vaccination_campaigns/1').to route_to('vaccination_campaigns#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/vaccination_campaigns/1/edit').to route_to('vaccination_campaigns#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/vaccination_campaigns').to route_to('vaccination_campaigns#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/vaccination_campaigns/1').to route_to('vaccination_campaigns#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/vaccination_campaigns/1').to route_to('vaccination_campaigns#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/vaccination_campaigns/1').to route_to('vaccination_campaigns#destroy', id: '1')
    end
  end
end
