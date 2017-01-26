require 'rails_helper'

describe FaqsController, type: :controller do
  sign_in!
  let(:valid_attributes) { attributes_for :faq }
  let(:invalid_attributes) { attributes_for :faq, answer: nil }

  describe 'GET #index' do
    it 'assigns all faqs as @faqs' do
      faq = Faq.create! valid_attributes
      get :index, params: {}
      expect(assigns(:faqs)).to eq([faq])
    end
  end

  describe 'GET #new' do
    it 'assigns a new faq as @faq' do
      get :new, params: {}
      expect(assigns(:faq)).to be_a_new(Faq)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested faq as @faq' do
      faq = Faq.create! valid_attributes
      get :edit, params: {id: faq.to_param}
      expect(assigns(:faq)).to eq(faq)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Faq' do
        expect {
          post :create, params: {faq: valid_attributes}
        }.to change(Faq, :count).by(1)
      end

      it 'assigns a newly created faq as @faq' do
        post :create, params: {faq: valid_attributes}
        expect(assigns(:faq)).to be_a(Faq)
        expect(assigns(:faq)).to be_persisted
      end

      it 'redirects to the faq path' do
        post :create, params: {faq: valid_attributes}
        expect(response).to redirect_to faqs_path
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved faq as @faq' do
        post :create, params: {faq: invalid_attributes}
        expect(assigns(:faq)).to be_a_new(Faq)
      end

      it "re-renders the 'new' template" do
        post :create, params: {faq: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :faq }

      it 'updates the requested faq' do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: new_attributes}
        faq.reload
      end

      it 'assigns the requested faq as @faq' do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: valid_attributes}
        expect(assigns(:faq)).to eq(faq)
      end

      it 'redirects to the faq' do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: valid_attributes}
        expect(response).to redirect_to faqs_path
      end
    end

    context 'with invalid params' do
      it 'assigns the faq as @faq' do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: invalid_attributes}
        expect(assigns(:faq)).to eq(faq)
      end

      it "re-renders the 'edit' template" do
        faq = Faq.create! valid_attributes
        put :update, params: {id: faq.to_param, faq: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested faq' do
      faq = Faq.create! valid_attributes
      expect {
        delete :destroy, params: {id: faq.to_param}
      }.to change(Faq, :count).by(-1)
    end

    it 'redirects to the faqs list' do
      faq = Faq.create! valid_attributes
      delete :destroy, params: {id: faq.to_param}
      expect(response).to redirect_to(faqs_url)
    end
  end
end
