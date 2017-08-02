module ApplicationHelper
  def per_page_options
    options = [5, 10, 15, 20, 25, 50]

    select_tag :per_page,
      options_for_select(options, params[:per_page])
  end
end
