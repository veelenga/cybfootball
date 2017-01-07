require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  sign_in!
  let(:valid_attributes) { attributes_for(:team) }
  let(:invalid_attributes) { attributes_for(:team, name: nil) }

  describe "GET #index" do
    it "assigns all teams as @teams" do
      team = Team.create! valid_attributes
      get :index, params: {}
      expect(assigns(:teams)).to eq([team])
    end
  end

  describe "GET #show" do
    it "assigns the requested team as @team" do
      team = Team.create! valid_attributes
      get :show, params: {id: team.to_param}
      expect(assigns(:team)).to eq(team)
    end

    it 'assigns the players of the team as @team_players' do
      team = create :team, players: [build(:player)]
      get :show, params: { id: team.to_param }
      expect(assigns(:team_players)).to eq team.players
    end
  end

  describe "GET #new" do
    it "assigns a new team as @team" do
      get :new, params: {}
      expect(assigns(:team)).to be_a_new(Team)
    end
  end

  describe "GET #edit" do
    it "assigns the requested team as @team" do
      team = Team.create! valid_attributes
      get :edit, params: {id: team.to_param}
      expect(assigns(:team)).to eq(team)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Team" do
        expect {
          post :create, params: {team: valid_attributes}
        }.to change(Team, :count).by(1)
      end

      it "assigns a newly created team as @team" do
        post :create, params: {team: valid_attributes}
        expect(assigns(:team)).to be_a(Team)
        expect(assigns(:team)).to be_persisted
      end

      it "redirects to the created team" do
        post :create, params: {team: valid_attributes}
        expect(response).to redirect_to(Team.last)
      end

      it 'acceptes attribute accessors attributes' do
        accessor_attributes = { crop_x: '10', crop_y: '20', crop_w: '30', crop_h: '40', crop_r: '50' }
        post :create, params: { team: valid_attributes.merge(accessor_attributes) }
        expect(assigns(:team).crop_x).to eql accessor_attributes[:crop_x]
        expect(assigns(:team).crop_y).to eql accessor_attributes[:crop_y]
        expect(assigns(:team).crop_w).to eql accessor_attributes[:crop_w]
        expect(assigns(:team).crop_h).to eql accessor_attributes[:crop_h]
        expect(assigns(:team).crop_r).to eql accessor_attributes[:crop_r]
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved team as @team" do
        post :create, params: {team: invalid_attributes}
        expect(assigns(:team)).to be_a_new(Team)
      end

      it "re-renders the 'new' template" do
        post :create, params: {team: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:team) }

      it "updates the requested team" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: new_attributes}
        team.reload
      end

      it "assigns the requested team as @team" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: valid_attributes}
        expect(assigns(:team)).to eq(team)
      end

      it "redirects to the team" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: valid_attributes}
        expect(response).to redirect_to(team)
      end
    end

    context "with invalid params" do
      it "assigns the team as @team" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: invalid_attributes}
        expect(assigns(:team)).to eq(team)
      end

      it "re-renders the 'edit' template" do
        team = Team.create! valid_attributes
        put :update, params: {id: team.to_param, team: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested team" do
      team = Team.create! valid_attributes
      expect {
        delete :destroy, params: {id: team.to_param}
      }.to change(Team, :count).by(-1)
    end

    it "redirects to the teams list" do
      team = Team.create! valid_attributes
      delete :destroy, params: {id: team.to_param}
      expect(response).to redirect_to(teams_url)
    end
  end

  describe 'PUT #update_players' do
    let(:team) { create :team }
    let(:player) { create :player }

    it 'adds a player to the team and redirects to team page' do
      expect {
        put :update_players, params: { id: team.to_param, player: { id: player.to_param, action: :add }}
      }.to change(team.players, :count).by 1
      expect(response).to redirect_to(team_path team)
    end

    it 'removes a player from the team and redirects to team page' do
      team.players << player
      expect {
        put :update_players, params: { id: team.to_param, player: { id: player.to_param, action: :delete } }
      }.to change(team.players, :count).by -1
      expect(response).to redirect_to(team_path team)
    end

    it 'raises error if required params not passed' do
      expect {
        put :update_players, params: { id: team.to_param }
      }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
