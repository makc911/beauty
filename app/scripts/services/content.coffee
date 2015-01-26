angular.module('beautyApp').service 'Content', ($window) ->

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


  return this