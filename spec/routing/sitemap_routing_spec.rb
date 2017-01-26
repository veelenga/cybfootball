require 'rails_helper'

describe SitemapController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/sitemap.xml').to route_to('sitemap#index', format: 'xml')
    end
  end
end
