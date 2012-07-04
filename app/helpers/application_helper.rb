
module ApplicationHelper

  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
    @markdown.render(text).html_safe
  end

  def form_for (*args)
    args << {} unless args.last.is_a? Hash

    args.last[:builder] ||= TwitterBootstrapFormBuilder
    args.last[:html] ||= {}
    args.last[:html][:class] ||= ""

    if !args.last[:html][:class].match(/form-(horizontal|vertical)/)
      args.last[:html][:class] = ["form-horizontal", args.last[:html][:class]].join(" ")
    end

    super
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

class TwitterBootstrapFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::DynamicForm::FormBuilderMethods

  def control_group(field = nil, opts = {}, &block)
    raise "Expected hash for options, got #{opts.inspect}" unless opts.is_a? Hash

    # wrap in array if not an array
    opts[:class] = Array(opts[:class])
    opts[:class] << "control-group"
    opts[:class] << field if field

    opts[:class] << "error" if @object.errors.messages.has_key? field

    @template.content_tag(:div, opts) do
      @template.capture &block
    end
  end

  %w(text_field phone_field password_field email_field number_field file_field text_area select).each do |method_name|
    define_method method_name.to_sym do |field, *args|

      # extract the options for the label tag
      opts = args.find { |a| a.is_a?(Hash) && a.has_key?(:label) }
      label_opts = opts ? opts[:label] : []

      # If label is false, we're rendering the field without modification
      return super (field, *args) if label_opts === false

      label_opts = Array[label_opts] << { :class => "control-label" }

      control_group(field, :class => "#{method_name}") do
        label(field, *label_opts) + @template.content_tag(:div, :class => "controls") do
          super(field, *args) + errors_for(field)
        end
      end.html_safe
    end

  end

  def errors_for(field)
    @template.content_tag(:p, "#{object.class.human_attribute_name(field)} #{object.errors.messages[field].join(",")}",
                          :class => "help-block") if object.errors.messages[field].any?
  end

end
