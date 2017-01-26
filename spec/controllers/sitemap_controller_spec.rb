require 'rails_helper'

describe SitemapController, type: :controller do
  describe "GET #index" do
    it 'assigns recent tournaments as @tournaments' do
      tournament = create :tournament
      get :index
      expect(assigns :tournaments).to eq [tournament]
    end

    it 'responds to xml' do
      get :index
      expect(response.content_type).to eql 'application/xml'
    end

    it 'renders sitemap/index layout' do
      get :index
      expect(response).to render_template('sitemap/index')
    end
  end
end
