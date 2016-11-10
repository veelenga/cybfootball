require 'rails_helper'

RSpec.describe TournamentsController, type: :controller do
  sign_in!
  let(:valid_attributes) { attributes_for(:tournament) }
  let(:invalid_attributes) { attributes_for(:tournament, no: nil) }

  describe "GET #index" do
    it "assigns all tournaments as @tournaments" do
      tournament = Tournament.create! valid_attributes
      get :index, params: {}
      expect(assigns(:tournaments)).to eq([tournament])
    end
  end

  describe "GET #show" do
    it "assigns the requested tournament as @tournament" do
      tournament = Tournament.create! valid_attributes
      get :show, params: {id: tournament.to_param}
      expect(assigns(:tournament)).to eq(tournament)
    end
  end

  describe "GET #new" do
    it "assigns a new tournament as @tournament" do
      get :new, params: {}
      expect(assigns(:tournament)).to be_a_new(Tournament)
    end
  end

  describe "GET #edit" do
    it "assigns the requested tournament as @tournament" do
      tournament = Tournament.create! valid_attributes
      get :edit, params: {id: tournament.to_param}
      expect(assigns(:tournament)).to eq(tournament)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tournament" do
        expect {
          post :create, params: {tournament: valid_attributes}
        }.to change(Tournament, :count).by(1)
      end

      it "assigns a newly created tournament as @tournament" do
        post :create, params: {tournament: valid_attributes}
        expect(assigns(:tournament)).to be_a(Tournament)
        expect(assigns(:tournament)).to be_persisted
      end

      it "redirects to the created tournament" do
        post :create, params: {tournament: valid_attributes}
        expect(response).to redirect_to(Tournament.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tournament as @tournament" do
        post :create, params: {tournament: invalid_attributes}
        expect(assigns(:tournament)).to be_a_new(Tournament)
      end

      it "re-renders the 'new' template" do
        post :create, params: {tournament: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:tournament) }

      it "updates the requested tournament" do
        tournament = Tournament.create! valid_attributes
        put :update, params: {id: tournament.to_param, tournament: new_attributes}
        tournament.reload
      end

      it "assigns the requested tournament as @tournament" do
        tournament = Tournament.create! valid_attributes
        put :update, params: {id: tournament.to_param, tournament: valid_attributes}
        expect(assigns(:tournament)).to eq(tournament)
      end

      it "redirects to the tournament" do
        tournament = Tournament.create! valid_attributes
        put :update, params: {id: tournament.to_param, tournament: valid_attributes}
        expect(response).to redirect_to(tournament)
      end
    end

    context "with invalid params" do
      it "assigns the tournament as @tournament" do
        tournament = Tournament.create! valid_attributes
        put :update, params: {id: tournament.to_param, tournament: invalid_attributes}
        expect(assigns(:tournament)).to eq(tournament)
      end

      it "re-renders the 'edit' template" do
        tournament = Tournament.create! valid_attributes
        put :update, params: {id: tournament.to_param, tournament: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tournament" do
      tournament = Tournament.create! valid_attributes
      expect {
        delete :destroy, params: {id: tournament.to_param}
      }.to change(Tournament, :count).by(-1)
    end

    it "redirects to the tournaments list" do
      tournament = Tournament.create! valid_attributes
      delete :destroy, params: {id: tournament.to_param}
      expect(response).to redirect_to(tournaments_url)
    end
  end

end
