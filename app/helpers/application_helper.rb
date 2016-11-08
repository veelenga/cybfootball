module ApplicationHelper
  def bootstrap_class_for(type)
    case type.to_sym
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
       'alert-success'
      else type.to_s
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
          concat content_tag(:button, '&times;'.html_safe, class: 'close', data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    nil
  end
end
