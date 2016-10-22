class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def store_per_page
    per = JSON.parse(cookies[:per]) rescue {}
    params[:per] ||= per[page_name] if per.present?
    cookies[:per] = JSON.generate({ page_name => params[:per] }.reverse_merge! per) if params[:per].present?
  end

  private

  def page_name
    @page_name ||= "#{controller_path}.#{action_name}"
  end
end
