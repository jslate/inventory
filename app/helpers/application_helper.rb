module ApplicationHelper

  def button_group(buttons)
    result = '<div class="btn-toolbar"><div class="btn-group">'
    buttons.each do |icon, href, options|
      options ||= {}
      options[:class] = options[:class].nil? ? 'btn' : "#{options[:class]} btn"
      result << link_to(%Q{<i class="icon-#{icon}"></i>}.html_safe, href, options)
    end
    result << '</div></div>'
    result.html_safe
  end


end
