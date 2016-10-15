module KaminariHelper
  DEFAULT_PER_PAGE_VALUES = [8, 16, 20, 40, 100]

  def per_page_links(list, values, options = {})
    per_page = params[:per].try(:to_i) || Kaminari.config.config[:default_per_page]

    (values || DEFAULT_PER_PAGE_VALUES).map do |value|
      url_params = { per: value }.merge options[:params].to_h
      url_params[:page] = params[:page] if list.total_count > value
      link_to_unless per_page == value, value, url_params, remote: options[:remote]
    end.join(options[:joiner] || ' | ')
  end
end
