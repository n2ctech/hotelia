module ApplicationHelper
  def per_page_options
    options = [5, 10, 15, 20, 25, 50]

    select_tag :per_page,
      options_for_select(options, params[:per_page])
  end

  def bootstrap_class_for flash_type
    flash_type = "alert-#{flash_type}"
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end
