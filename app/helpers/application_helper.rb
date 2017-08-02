module ApplicationHelper
  def per_page_options
    options = [5, 10, 15, 20, 25, 50]

    select_tag :per_page,
      options_for_select(options, params[:per_page])
  end

  def sort_column_select_tag options
    select_tag :sort_column,
      options_for_select(options, params[:sort_column]),
      id: "sort-column"
  end

  def sort_type_select_tag options
    select_tag :sort_type,
      options_for_select(options, params[:sort_type]),
      id: "sort-type"
  end
end
