$("#per_page").change ->
  url = new URL(window.location)
  url.searchParams.set("per_page", @value)
  window.location = url.href

$("#sort-column").change ->
  url = new URL(window.location)
  url.searchParams.set("sort_column", @value)
  url.searchParams.set("sort_type", $("#sort-type").val())
  window.location = url.href

$("#sort-type").change ->
  if !$("#sort-column").val()
    return
  url = new URL(window.location)
  url.searchParams.set("sort_type", @value)
  window.location = url.href

$(".select2").select2()
