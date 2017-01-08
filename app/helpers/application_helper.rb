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

  def flashes
    flash.delete(:timedout).map do |type, text|
      { type: type, text: text }
    end
  end

  def flash_messages(opts = {})
    flashes.each do |message|
      concat(
        content_tag(:div, message[:text], class: "alert #{bootstrap_class_for(message[:type])} fade in") do
          concat content_tag(:button, '&times;'.html_safe, class: 'close', data: { dismiss: 'alert' })
          concat message[:text]
        end
      )
    end
    nil
  end
end
