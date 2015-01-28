angular.module('beautyApp').service 'Content', ($window, $document, $location) ->

  @section = [
    {anchor: "about", title: "Обо мне"}
    {anchor: "depilation", title: "Депиляция"}
    {anchor: "eyelashes", title: "Ресницы"}
    {anchor: "tattoo", title: "Татуаж"}
    {anchor: "piercing", title: "Пирсинг"}
    {anchor: "contact", title: "Контакты"}
  ]

  @depilList = [
    {title:"Бикини", price: "150.00"},
    {title:"Депиляция голени", price: "80.00"},
    {title:"Верхняя поверхность бедра", price: "80.00"},
    {title:"Полная депиляция ног", price: "120.00"},
    {title:"Руки (предплечье)", price: "40.00"},
    {title:"Полная депиляция ног", price: "60.00"},
    {title:"Подмышки", price: "50.00"},
    {title:"Верхняя губа", price: "25.00"},
    {title:"Подбородок", price: "25.00"},
    {title:"Спина (поясница)", price: "40.00"},
    {title:"Полная депиляция спины", price: "100.00"},
    {title:"Ореол груди", price: "20.00"}
  ]

  @eyelashesList = [
    {title:"Наращивание ресниц", price: "300.00"}
    {title:"Коррекция (полное снятие и установка новых)", price: "180.00"}
    {title:"Снятие ресниц", price: "50.00"}
  ]

  @piercingList = [
    {title:"Нос", price: "150.00"}
    {title:"Пупок", price: "100.00"}
    {title:"Уши (козенок, хрящик, мочка)", price: "100.00"}
    {title:"Брови", price: "100.00"}
    {title:"Соски", price: "100.00"}
  ]

  @tattooList = [
    {title:"Брови", price: "700.00"}
    {title:"Стрелки глаз", price: "700.00"}
    {title:"Губы", price: "700.00"}
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