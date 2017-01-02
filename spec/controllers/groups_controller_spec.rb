require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  sign_in!
  let(:tournament) { create(:tournament) }
  let(:default_params) { {tournament_id: tournament.id} }
  let(:valid_attributes) { attributes_for(:group, tournament_id: tournament.id) }
  let(:invalid_attributes) { attributes_for(:group, name: nil, tournament_id: tournament.id) }

  describe 'GET #new' do
    it 'assigns a new group as @group' do
      get :new, params: default_params
      expect(assigns(:group)).to be_a_new(Group)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested group as @group' do
      group = Group.create! valid_attributes
      get :edit, params: {id: group.to_param}.merge!(default_params)
      expect(assigns(:group)).to eq(group)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Group' do
        expect {
          post :create, params: {group: valid_attributes}.merge!(default_params)
        }.to change(Group, :count).by(1)
      end

      it 'assigns a newly created group as @group' do
        post :create, params: {group: valid_attributes}.merge!(default_params)
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end

      it 'redirects to the created group' do
        post :create, params: {group: valid_attributes}.merge!(default_params)
        expect(response).to redirect_to(tournament)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved group as @group' do
        post :create, params: {group: invalid_attributes}.merge!(default_params)
        expect(assigns(:group)).to be_a_new(Group)
      end

      it 're-renders the new template' do
        post :create, params: {group: invalid_attributes}.merge!(default_params)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'assigns the requested group as @group' do
        group = Group.create! valid_attributes
        put :update, params: {id: group.to_param, group: valid_attributes}.merge!(default_params)
        expect(assigns(:group)).to eq(group)
      end

      it 'redirects to the group' do
        group = Group.create! valid_attributes
        put :update, params: {id: group.to_param, group: valid_attributes}.merge!(default_params)
        expect(response).to redirect_to(group)
      end
    end

    context 'with invalid params' do
      it 'assigns the group as @group' do
        group = Group.create! valid_attributes
        put :update, params: {id: group.to_param, group: invalid_attributes}.merge!(default_params)
        expect(assigns(:group)).to eq(group)
      end

      it 're-renders the edit template' do
        group = Group.create! valid_attributes
        put :update, params: {id: group.to_param, group: invalid_attributes}.merge!(default_params)
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested group' do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, params: {id: group.to_param}.merge!(default_params)
      }.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = Group.create! valid_attributes
      delete :destroy, params: {id: group.to_param}.merge!(default_params)
      expect(response).to redirect_to(group_url group)
    end
  end
end
