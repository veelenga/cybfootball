require "rails_helper"

RSpec.describe GroupsController, type: :routing do
  describe "groups routing" do
    let(:id) { '1' }
    let(:outer_path) { '/tournaments/1' }

    it 'routes to #new' do
      expect(:get => "#{outer_path}/groups/new").to route_to('groups#new', :tournament_id => id)
    end

    it 'routes to #edit' do
      expect(:get => "#{outer_path}/groups/1/edit").to route_to('groups#edit', :id => "1", :tournament_id => id)
    end

    it 'routes to #create' do
      expect(:post => "#{outer_path}/groups").to route_to('groups#create', :tournament_id => id)
    end

    it 'routes to #update via PUT' do
      expect(:put => "#{outer_path}/groups/1").to route_to('groups#update', :id => "1", :tournament_id => id)
    end

    it 'routes to #update via PATCH' do
      expect(:patch => "#{outer_path}/groups/1").to route_to('groups#update', :id => "1", :tournament_id => id)
    end

    it 'routes to #destroy' do
      expect(:delete => "#{outer_path}/groups/1").to route_to('groups#destroy', :id => "1", :tournament_id => id)
    end
  end
end
