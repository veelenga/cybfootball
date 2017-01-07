require "rails_helper"

RSpec.describe GroupsController, type: :routing do
  describe "groups routing" do
    it 'routes to #new' do
      expect(:get => "/tournaments/1/groups/new").to route_to('groups#new', tournament_id: '1')
    end

    it 'routes to #edit' do
      expect(:get => "/groups/1/edit").to route_to('groups#edit', id: '1')
    end

    it 'routes to #create' do
      expect(:post => "/tournaments/1/groups").to route_to('groups#create', tournament_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/groups/1').to route_to('groups#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/groups/1').to route_to('groups#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/groups/1').to route_to('groups#destroy', id: '1')
    end

    it 'routes to #update_teams' do
      expect(:put => '/groups/1/update_teams').to route_to('groups#update_teams', id: '1')
    end

    it 'routes to #search_teams' do
      expect(:get => '/groups/1/search_teams').to route_to('groups#search_teams', id: '1')
    end
  end
end
