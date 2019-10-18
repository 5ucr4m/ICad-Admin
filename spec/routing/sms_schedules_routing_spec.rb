# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SmsSchedulesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/sms_schedules').to route_to('sms_schedules#index')
    end

    it 'routes to #new' do
      expect(get: '/sms_schedules/new').to route_to('sms_schedules#new')
    end

    it 'routes to #show' do
      expect(get: '/sms_schedules/1').to route_to('sms_schedules#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/sms_schedules/1/edit').to route_to('sms_schedules#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/sms_schedules').to route_to('sms_schedules#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/sms_schedules/1').to route_to('sms_schedules#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/sms_schedules/1').to route_to('sms_schedules#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/sms_schedules/1').to route_to('sms_schedules#destroy', id: '1')
    end
  end
end
