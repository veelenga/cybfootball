require 'rails_helper'

describe SessionsController, type: :controller do
  let(:visitor) { create :user }
  let(:admin) { create :root }

  describe 'POST #create' do
    it 'signs in visitor' do
      sign_in visitor
      expect(subject.current_user).to eql visitor
    end

    it 'signs in admin' do
      sign_in admin
      expect(subject.current_user).to eql admin
    end

    it 'does not sign in wrong user' do
      sign_in build :user
      expect(subject.current_user).to be_nil
    end
  end

  describe 'DELETE #destroy' do
    it 'signs out' do
      sign_in visitor
      sign_out visitor
      expect(subject.current_user).to be_nil
    end
  end
end
