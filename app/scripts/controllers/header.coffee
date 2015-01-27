
angular.module('beautyApp').controller 'HeaderCtrl', ($scope, $document, $location, Content) ->


  $scope.navBar = Content.section

  $scope.goScreen = (id_screen) ->
    Content.goScreen id_screen
#    elm_screen = document.getElementById id_screen
#    $document.scrollToElementAnimated elm_screen
#    $location.path("/#{id_screen}")
#    $location.replace()
#    history.pushState null, '', $location.url()
#    return true