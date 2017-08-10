$ ->
  if $(window).width() > 1025
    $(".off-click").off("click")

  $(".cd-dropdown-wrapper").click ->
    $dropdown = $(@)
    setTimeout (->
      if $dropdown.hasClass("openned")
        $dropdown.removeClass("openned")
      else
        $dropdown.addClass("openned")
    ), 500

  $(document).click ->
    if $(".cd-dropdown-wrapper").hasClass("openned")
      $(".cd-dropdown-wrapper").removeClass("openned")
      toggleNav()

  toggleNav = ->
    navIsVisible = if !$('.cd-dropdown').hasClass('dropdown-is-active') then true else false
    $('.cd-dropdown').toggleClass 'dropdown-is-active', navIsVisible
    $('.cd-dropdown-trigger').toggleClass 'dropdown-is-active', navIsVisible
    if !navIsVisible
      $('.cd-dropdown').one 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', ->
        $('.has-children ul').addClass 'is-hidden'
        $('.move-out').removeClass 'move-out'
        $('.is-active').removeClass 'is-active'
        return
    return
