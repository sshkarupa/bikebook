module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg) }.join
    html = <<-HTML
    <div class="flash">
      <div class="message alert">#{messages}</div>
    </div>
    HTML

    html.html_safe
  end
end