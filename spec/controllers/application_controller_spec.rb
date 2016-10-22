require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#store_per_page' do
    controller do
      before_action :store_per_page, only: [:index]

      def index
        @per = params[:per]
        head :ok
      end
    end

    it 'saves param per page' do
      get :index, params: { per: '8' }
      expect(assigns :per).to eql '8'
    end

    it 'uses previously used per page param' do
      get :index, params: { per: '9' }
      get :index
      expect(assigns :per).to eql '9'
    end

    it 'uses new param if it is specifed' do
      get :index, params: { per: '8'}
      get :index, params: { per: '9'}
      expect(assigns :per).to eql '9'
    end

    it 'does not fail if param not saved nor specified' do
      get :index
      expect(assigns :per).to be_nil
    end

    it 'does not fail if param is wrong' do
      get :index, params: { per: 'wrong_type' }
      expect(assigns :per).to eql 'wrong_type'
    end
  end
end
