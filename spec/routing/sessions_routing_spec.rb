require "rails_helper"

RSpec.describe Devise::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #sign_in' do
      expect(post: '/sign_in').to route_to('sessions#create')
    end

    it 'routes to #sign_out' do
      expect(delete: '/sign_out').to route_to('sessions#destroy')
    end
  end
end
