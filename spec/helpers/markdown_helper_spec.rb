require 'rails_helper'

describe MarkdownHelper, type: :helper do
  describe '#markdown' do
    it 'converts markdown to html' do
      expect(markdown('### Header')).to eql "<h3>Header</h3>\n"
    end

    it 'wraps even plain text' do
      expect(markdown('plain text')).to eql "<p>plain text</p>\n"
    end

    it 'avoids xss related tags' do
      xss = '<scirpt>alert("bang!")</script>'
      expect(markdown(xss)).to eql "<p>alert(&quot;bang!&quot;)</p>\n"
    end
  end
end
