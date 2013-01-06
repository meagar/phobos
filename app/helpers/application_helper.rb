
module ApplicationHelper

  include MNE::TwitterBootstrapFormBuilder::Helper

  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
    @markdown.render(text).html_safe
  end

  def body_classes
    "#{controller.controller_name}-#{controller.action_name}"
  end

  def section(title, sub_title = nil, options = {}, &block)
    if sub_title.is_a? Hash
      options = sub_title
      sub_title = nil
    end

    content_tag(:section, options) do
      content_tag(:div, :class => "page-header") do
        content_tag(:h1) do
          title.html_safe + (sub_title ? (" " + content_tag(:small, sub_title)) : "").html_safe
        end
      end + capture(&block)
    end
  end

end
