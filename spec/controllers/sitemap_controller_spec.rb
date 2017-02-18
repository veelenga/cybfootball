require 'rails_helper'

describe SitemapController, type: :controller do
  describe "GET #index" do
    it 'assigns recent tournaments as @tournaments' do
      tournament = create :tournament
      get :index
      expect(assigns :tournaments).to eq [tournament]
    end

    it 'assigns recent pages as @pages' do
      create :page
      get :index
      expect(assigns :pages).not_to be_empty
    end

    it 'assigns recent faqs lastmode as @faqs_lastmod' do
      faq = create :faq
      get :index
      expect(assigns :faqs_lastmod).to eql faq.updated_at
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
