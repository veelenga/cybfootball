require 'rails_helper'

describe PagesController, type: :controller do
  sign_in!
  let(:valid_attributes) { attributes_for(:page, path: 'about') }
  let(:invalid_attributes) { attributes_for(:page, path: nil) }

  describe 'GET #show' do
    it 'assigns the requested page as @page' do
      page = Page.create! valid_attributes
      get :show, params: {id: page.path}
      expect(assigns :page).to eq(page)
    end
  end

  describe 'GET #new' do
    it 'assigns a new page as @page' do
      get :new, params: {}
      expect(assigns :page).to be_a_new(Page)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested page as @page' do
      page = Page.create! valid_attributes
      get :edit, params: {id: page.to_param}
      expect(assigns(:page)).to eq(page)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Page' do
        expect {
          post :create, params: {page: valid_attributes}
        }.to change(Page, :count).by(1)
      end

      it 'assigns a newly created page as @page' do
        post :create, params: {page: valid_attributes}
        expect(assigns(:page)).to be_a(Page)
        expect(assigns(:page)).to be_persisted
      end

      it 'redirects to the created page' do
        post :create, params: {page: valid_attributes}
        expect(response).to redirect_to("/#{Page.last.path}")
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved page as @page' do
        post :create, params: {page: invalid_attributes}
        expect(assigns(:page)).to be_a_new(Page)
      end

      it "re-renders the 'new' template" do
        post :create, params: {page: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:page) }

      it 'updates the requested page' do
        page = Page.create! valid_attributes
        put :update, params: {id: page.to_param, page: new_attributes}
        page.reload
        expect(page.path).to eq(new_attributes[:path])
      end

      it 'assigns the requested page as @page' do
        page = Page.create! valid_attributes
        put :update, params: {id: page.to_param, page: valid_attributes}
        expect(assigns(:page)).to eq(page)
      end

      it 'redirects to the page' do
        page = Page.create! valid_attributes
        put :update, params: {id: page.to_param, page: valid_attributes}
        expect(response).to redirect_to("/#{page.path}")
      end
    end

    context 'with invalid params' do
      it 'assigns the page as @page' do
        page = Page.create! valid_attributes
        put :update, params: {id: page.to_param, page: invalid_attributes}
        expect(assigns(:page)).to eq(page)
      end

      it "re-renders the 'edit' template" do
        page = Page.create! valid_attributes
        put :update, params: {id: page.to_param, page: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested page' do
      page = Page.create! valid_attributes
      expect {
        delete :destroy, params: {id: page.to_param}
      }.to change(Page, :count).by(-1)
    end

    it 'redirects to the root url' do
      page = Page.create! valid_attributes
      delete :destroy, params: {id: page.to_param}
      expect(response).to redirect_to root_url
    end
  end
end
