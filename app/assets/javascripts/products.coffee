window.rangSliderint = ->
  'use strict'
  sliderRange = $('#slider-range')
  sliderRange.slider
    range: true
    min: 0
    max: 1000
    values: [
      $("#price-gteq").val() || 100,
      $("#price-lteq").val() || 500
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
