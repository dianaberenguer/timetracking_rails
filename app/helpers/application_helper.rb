module ApplicationHelper

def flash_message
    flash.key.map do |type|
      message_div(type)
    end.join.html_safe
  end


  private

  def message_div(type)
    content_tag :div, class: 'message ' + type.to_s do
      content_tag :p do
        message
      end
    end
  end
end