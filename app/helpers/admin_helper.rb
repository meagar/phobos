
module AdminHelper

  class AdminOptsHelper < Struct.new(:template)
    def link_to(*args)
      template.content_tag(:li, template.link_to(*args))
    end
  end

  def admin_opts(&block)
    content_tag(:div, :class => "subnav admin-options") do
      content_tag(:ul, :class => "nav nav-pills") do
        yield AdminOptsHelper.new(self)
      end
    end
  end

end
