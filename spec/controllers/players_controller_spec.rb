require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  let(:valid_attributes) { attributes_for(:player) }
  let(:invalid_attributes) { attributes_for(:player, fio: nil) }

  describe "GET #index" do
    it "assigns all players as @players" do
      player = Player.create! valid_attributes
      get :index, params: {}
      expect(assigns(:players)).to eq([player])
    end
  end

  describe "GET #show" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :show, params: {id: player.to_param}
      expect(assigns(:player)).to eq(player)
    end
  end

  describe "GET #new" do
    it "assigns a new player as @player" do
      get :new, params: {}
      expect(assigns(:player)).to be_a_new(Player)
    end
  end

  describe "GET #edit" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :edit, params: {id: player.to_param}
      expect(assigns(:player)).to eq(player)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Player" do
        expect {
          post :create, params: {player: valid_attributes}
        }.to change(Player, :count).by(1)
      end

      it "assigns a newly created player as @player" do
        post :create, params: {player: valid_attributes}
        expect(assigns(:player)).to be_a(Player)
        expect(assigns(:player)).to be_persisted
      end

      it "redirects to the created player" do
        post :create, params: {player: valid_attributes}
        expect(response).to redirect_to(Player.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved player as @player" do
        post :create, params: {player: invalid_attributes}
        expect(assigns(:player)).to be_a_new(Player)
      end

      it "re-renders the 'new' template" do
        post :create, params: {player: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:player)
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: new_attributes}
        player.reload
      end

      it "assigns the requested player as @player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: valid_attributes}
        expect(assigns(:player)).to eq(player)
      end

      it "redirects to the player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: valid_attributes}
        expect(response).to redirect_to(player)
      end
    end

    context "with invalid params" do
      it "assigns the player as @player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: invalid_attributes}
        expect(assigns(:player)).to eq(player)
      end

      it "re-renders the 'edit' template" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested player" do
      player = Player.create! valid_attributes
      expect {
        delete :destroy, params: {id: player.to_param}
      }.to change(Player, :count).by(-1)
    end

    it "redirects to the players list" do
      player = Player.create! valid_attributes
      delete :destroy, params: {id: player.to_param}
      expect(response).to redirect_to(players_url)
    end
  end
end
