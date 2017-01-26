class SitemapController < ActionController::Base
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'

    respond_to do |format|
      format.xml { @tournaments = Tournament.select(:id, :updated_at).recent(100) }
    end
  end
end
