require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  sign_in!(:visitor)

  describe 'GET #settings' do
    it 'assigns current user as @user' do
      get :settings
      expect(assigns :user).to eql subject.current_user
    end
  end

  describe 'PUT #update_password' do
    let(:valid_params) do
      { password: 'MegaP@ssword', password_confirmation: 'MegaP@ssword' }
    end

    let(:invalid_params) do
      { password: 'MegaP@ssword', password_confirmation: 'MegaP@ssw0rd' }
    end

    let(:current_password) { DEFAULT_PASSWORD }

    it 'changes user password and redirects to settings_path' do
      expect {
        put :update_password, params: {user: valid_params.merge!(current_password: current_password) }
      }.to change { User.find(subject.current_user.id).encrypted_password }
      expect(response).to redirect_to settings_path
    end

    it 'does not change user password if current_password incorrect and renders settings' do
      expect {
        put :update_password, params: {user: valid_params.merge!(current_password: 'wrong_password') }
      }.not_to change { User.find(subject.current_user.id).encrypted_password }
      expect(response).to render_template :settings
    end

    it 'does not change user password if confirmation does not match and renders settings' do
      expect {
        put :update_password, params: {user: invalid_params.merge!(current_password: current_password) }
      }.not_to change { User.find(subject.current_user.id).encrypted_password }
      expect(response).to render_template :settings
    end

    it 'does not change password to empty' do
      expect {
        put :update_password, params: { user: {current_password: current_password, password: '', password_confirmation: ''} }
      }.not_to change { User.find(subject.current_user.id).encrypted_password }
    end
  end
end
