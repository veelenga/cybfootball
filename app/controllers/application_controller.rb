class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def store_per_page
    per = JSON.parse(cookies[:per]) rescue nil
    params[:per] ||= per[controller_path] if per.present?
    cookies[:per] = JSON.generate({controller_path => params[:per]}.reverse_merge!(per || {})) if params[:per].present?
  end
end
