module ApplicationHelper
  def icon(*args)
    options = args.extract_options!
    icon = args.first.to_s
 
    return content_tag(:i, :class => "fa #{icon} fa-fw") do
    end
  end
end
