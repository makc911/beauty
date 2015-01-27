angular.module('beautyApp').service 'Content', ($window, $document, $location) ->

  @section = [
    {anchor: "about", title: "Обо мне"}
    {anchor: "depilation", title: "Депиляция"}
    {anchor: "eyelashes", title: "Ресницы"}
    {anchor: "tattoo", title: "Татуаж"}
    {anchor: "piercing", title: "Пирсинг"}
    {anchor: "contact", title: "Контакты"}
  ]

  sectionsY = []

  @getPositionY = () ->
    sectionsY.push {title:'home', y: 0}
    for item in this.section
      element = document.getElementById item.anchor
      sectionsY.push {title:item.anchor, y: element.offsetTop}
    return sectionsY

  @getSectionIdByY = (yTop) ->
    current = 'home'
    for item in sectionsY
      if yTop > item.y-$window.innerHeight*0.2 then current = item.title
    return current

  @goScreen = (id_screen, scroll) ->
    if scroll == false then scr = false else scr = true
    if scr
      elm_screen = document.getElementById id_screen
      $document.scrollToElementAnimated elm_screen
    $location.path("/#{id_screen}")
    $location.replace()
    history.pushState null, '', $location.url()
    return true

  return this