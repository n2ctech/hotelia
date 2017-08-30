window.rangSliderint = ->
  'use strict'
  sliderRange = $('#slider-range')
  minPrice = parseInt($('#min-price').val() || 0)
  maxPrice = parseInt($('#max-price').val() || 1000)
  sliderRange.slider
    range: true
    min: minPrice
    max: maxPrice
    values: [
      $("#price-gteq").val() || minPrice,
      $("#price-lteq").val() || maxPrice
    ]
    slide: (event, ui) ->
      setSearchPriceValue ui.values
      return
  setSearchPriceValue [sliderRange.slider('values', 0), sliderRange.slider('values', 1)]
  return

setSearchPriceValue = (values) ->
  $('#amount').val priceSymbol() + values[0] + ' - ' + priceSymbol() + values[1]
  $("#price-gteq").val(values[0])
  $("#price-lteq").val(values[1])
