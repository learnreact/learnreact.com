module ApplicationHelper
  def format_markdown(markdown)
    if markdown.present?
      renderer = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(with_toc_data: true),
        autolink: true,
        tables: true,
        fenced_code_blocks: true,
        no_intra_emphasis: true,
      )
      renderer.render(markdown).html_safe
    else
      ""
    end
  end
end
