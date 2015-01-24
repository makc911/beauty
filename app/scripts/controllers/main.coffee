angular.module('beautyApp').controller 'MainCtrl', ($scope) ->

  $scope.text =
    msg: "Test massage"

  $scope.navBar = ['a','b','c']

  console.log "main", $scope.navBar
#    {anchor: "about", title: "О бо мне"}
#    {anchor: "waxing", title: "Деппиляция"}
#    {anchor: "eyelashes", title: "Ресницы"}
#    {anchor: "permanents", title: "Татуаж"}
#    {anchor: "piercing", title: "Пирсинг"}
#    {anchor: "contacts", title: "Контакты"}
