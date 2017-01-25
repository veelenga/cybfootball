module KaminariHelper
  PAGE_PARAM = :page
  PER_PAGE_PARAM = :per
  PER_PAGE_DEFAULT_VALUES = [8, 16, 20, 40, 100]

  def per_page_links(list, options = {})
    page, per = current_page, current_per_page

    (options[:values] || PER_PAGE_DEFAULT_VALUES).map do |value|
      link_params = { PER_PAGE_PARAM => value }.reverse_merge!(options[:params] || {})
      link_params[PAGE_PARAM] = page if page && list.total_count > value * page
      link_to_unless per.to_i == value, value, link_params, remote: options[:remote]
    end.join(options[:joiner] || ' | ')
  end

  private

  def current_per_page
    params[PER_PAGE_PARAM].try(:to_i) || Kaminari.config[:default_per_page]
  end

  def current_page
    params[PAGE_PARAM].try(:to_i)
  end
end
