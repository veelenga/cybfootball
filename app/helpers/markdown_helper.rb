module MarkdownHelper
  DEFAULT_OPTIONS = {
    filter_html: true,
    hard_wrap: true,
    link_attributes: { rel: 'nofollow', target: "_blank" },
    space_after_headers: true,
    fenced_code_blocks: true
  }

  DEFAULT_EXTENSIONS = {
    autolink: true,
    superscript: true,
    disable_indented_code_blocks: true
  }

  def markdown(text, opts = {})
    renderer = Redcarpet::Render::HTML.new DEFAULT_OPTIONS.merge(opts[:options] || {})
    markdown = Redcarpet::Markdown.new renderer, DEFAULT_EXTENSIONS.merge(opts[:extensions] || {})

    markdown.render(text).html_safe
  end
end
