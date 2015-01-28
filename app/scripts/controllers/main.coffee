angular.module('beautyApp').controller 'MainCtrl', ($scope, $routeParams, $location, $timeout, $document, $window, Content) ->

  $scope.timeToChange = ''
  $scope.isPrice =
    depil: false
    piercing: false
    tattoo: false
    eyelashes: false

  $scope.depilList = Content.depilList
  $scope.eyelashesList = Content.eyelashesList
  $scope.piercingList = Content.piercingList
  $scope.tattooList = Content.tattooList

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

  $scope.$on 'blockSize.changed', ->
    $timeout ->
        Content.getPositionY()
      , 1100

  $scope.showPrise = (type) ->
    $scope.isPrice[type] = !$scope.isPrice[type]


