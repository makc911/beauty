angular.module('beautyApp').controller 'FooterCtrl', ($scope) ->

  $scope.text =
    msg: "Test massage"

  $scope.navBar = ['a','b','c']

  console.log "footer", $scope.navBar