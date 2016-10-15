require 'rails_helper'

RSpec.describe KaminariHelper, type: :helper do
  describe '#per_page_links' do
    let(:resource) { 'players' }
    let(:list) { instance_double('list', total_count: 10) }
    let(:params) do
      { controller: resource }
    end

    it 'generates default per page links' do
      expect(per_page_links(list, params: params)).not_to be_nil
    end

    it 'generates specified per page links' do
      expect(per_page_links(list, values: [5, 10], params: params)).to eq %Q{<a href="/#{resource}?per=5">5</a> | <a href="/#{resource}?per=10">10</a>}
    end

    it 'can generate links with different joiner' do
      expect(per_page_links(list, values: [1, 3], joiner: " ", params: params)).to eq %Q{<a href="/#{resource}?per=1">1</a> <a href="/#{resource}?per=3">3</a>}
    end

    it 'generates links with other params' do
      expect(per_page_links(list, values: [11], params: { per: 3, page: 10, search: 'cool' }.merge!(params)))
        .to eq %Q{<a href=\"/#{resource}?page=10&amp;per=11&amp;search=cool\">11</a>}
    end
  end
end
