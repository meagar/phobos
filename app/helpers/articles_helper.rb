
module ArticlesHelper

  def article_formats
    Article::FORMATS
  end

  def article_format_options
    article_formats
  end

  def format_text(text, format)
    case format
    when "HTML"
      text.html_safe
    when "Markdown"
      markdown(text).html_safe
    else
      throw "Unknown text format: #{format}"
    end
  end

end
