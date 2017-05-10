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

  def embedded_svg(svg, options = {})
    doc = Nokogiri::HTML::DocumentFragment.parse(svg)
    output_svg = doc.at_css("svg")
    output_svg["style"] = "display: block"
    if options[:size].present?
      output_svg["width"] = options[:size]
      output_svg["height"] = options[:size]
    end
    raw doc
  end
end
