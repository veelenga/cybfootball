require "rails_helper"

RSpec.describe Devise::SessionsController, type: :routing do
  describe 'sessions routing' do
    it 'routes to #sign_in' do
      expect(post: '/sign_in').to route_to('sessions#create')
    end

    it 'routes to #sign_out' do
      expect(delete: '/sign_out').to route_to('sessions#destroy')
    end

    it 'routes to #settings' do
      expect(get: '/settings').to route_to('users#settings')
    end

    it 'routes to #update_password' do
      expect(patch: '/update_password').to route_to('users#update_password')
    end

    it 'routes to #settings' do
      expect(get: '/update_password').to route_to('users#settings')
    end
  end
end
