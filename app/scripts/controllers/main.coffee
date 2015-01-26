angular.module('beautyApp').controller 'MainCtrl', ($scope, $routeParams, $location, $timeout, $document, $window, Content) ->

  console.log "Route params", $routeParams
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
#    console.log "$window.scrollY - #{$window.scrollY}"
    newSection = Content.getSectionIdByY $window.scrollY
    if newSection != currentSection
      console.log "New section - #{newSection}, old section - #{currentSection}, $window.innerHeight  #{$window.innerHeight}"
      currentSection = newSection
      $location.path(currentSection)
      $location.replace()
      history.pushState null, '', $location.url()

#    console.log "offset_bottom - #{offset_bottom}. document.body.offsetHeight - #{document.body.offsetHeight}. $window.innerHeight - #{$window.innerHeight}"

  $window.addEventListener 'scroll', changePath


