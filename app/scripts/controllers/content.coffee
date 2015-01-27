
angular.module('beautyApp').controller 'ContentCtrl', ($scope, $document, $location, Content) ->

  $scope.goUp = () ->
    Content.goScreen "home"
#    elm_screen = document.getElementById "home"
#    $document.scrollToElementAnimated elm_screen
#    $location.path("home")
#    $location.replace()
#    history.pushState null, '', $location.url()
#    return true