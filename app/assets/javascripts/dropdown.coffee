$ ->
  if $(window).width() > 1025
    $(".off-click").off("click")

  $(document).click (e) ->
    $(".cd-dropdown-wrapper").each (index, element) ->
      if $(e.target).parents(".cd-dropdown-wrapper").first().attr('id') == $(element).attr('id')
        return
      if $(element).hasClass("dropdown-is-active")
        $(element).removeClass("dropdown-is-active")
        hideNav($(element))

  hideNav = ($element) ->
    navIsVisible = false
    $element.find('.cd-dropdown').toggleClass 'dropdown-is-active', navIsVisible
    $element.toggleClass 'dropdown-is-active', navIsVisible
    if !navIsVisible
      $('.cd-dropdown').one 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', ->
        $('.has-children ul').addClass 'is-hidden'
        $('.move-out').removeClass 'move-out'
        $('.is-active').removeClass 'is-active'
        return
    return
