$("#per_page").change ->
  url = new URL(window.location)
  url.searchParams.set("per_page", @value)
  window.location = url.href

$(".select2").select2()

window.priceSymbol = (currency) ->
  currency ||= $("#currency").text()
  switch currency
    when 'EUR'
      return '€'
    when 'USD'
      return 'U$'
    when 'CVE'
      return 'C$'
    else
      return 'U$'
