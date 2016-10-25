class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def store_per_page
    per = JSON.parse(cookies[:per]) rescue {}
    params[:per] ||= per[page_name] if per.present?
    cookies[:per] = JSON.generate({ page_name => params[:per] }.reverse_merge! per) if params[:per].present?
  end

  def set_locale
    I18n.locale = I18n.available_locales.include?(params[:locale].try :to_sym) ? params[:locale] : I18n.default_locale
  end

  def default_url_options
    I18n.locale != I18n.default_locale ? { locale: I18n.locale } : {}
  end

  private

  def page_name
    @page_name ||= "#{controller_path}.#{action_name}"
  end
end
