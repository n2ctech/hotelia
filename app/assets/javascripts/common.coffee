$("#per_page").change ->
  url = new URL(window.location)
  url.searchParams.set("per_page", @value)
  window.location = url.href

$(".select2").select2()
