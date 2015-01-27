angular.module('beautyApp').controller 'MainCtrl', ($scope, $routeParams, $location, $timeout, $document, $window, Content) ->

  $scope.timeToChange = ''
  $scope.isPrice =
    depil: false
    piercing: false
    tattoo: false
    eyelashes: false

  $scope.depilList = [
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

  if !$routeParams.path
    console.log "Path is empty"
    $location.path("/home")
    $location.replace()
    history.pushState null, '', $location.url()

  currentSection = $routeParams.path || 'home'
  console.log "currentSection", currentSection

#  $timeout ->
  init = ->
    elm_screen = document.getElementById currentSection
    console.log "elem", elm_screen
    $document.scrollToElementAnimated elm_screen
    console.log Content.getPositionY()
  init()

  changePath = ->
    newSection = Content.getSectionIdByY $window.scrollY
    if newSection != currentSection
      currentSection = newSection
      $timeout.cancel $scope.timeToChange
      $scope.timeToChange = $timeout ->
          Content.goScreen currentSection, false
          $location.path(currentSection)
          $location.replace()
          history.pushState null, '', $location.url()
        ,200

  $window.addEventListener 'scroll', changePath

  $scope.showPrise = (type) ->
    $scope.isPrice[type] = !$scope.isPrice[type]


