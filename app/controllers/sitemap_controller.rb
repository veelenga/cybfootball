class SitemapController < ActionController::Base
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'

    @tournaments = Tournament.select(:id, :updated_at)
    @pages = Page.select(:path, :updated_at)
    @faqs_lastmod = Faq.maximum(:updated_at)

    respond_to { |format| format.xml }
  end
end
