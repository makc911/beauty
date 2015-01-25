
angular.module('beautyApp').controller 'HeaderCtrl', ($scope, $document, $window) ->


  $scope.navBar = [
    {anchor: "about_wrap", title: "О бо мне"}
    {anchor: "depil_wrap", title: "Депиляция"}
    {anchor: "eyelashes_wrap", title: "Ресницы"}
    {anchor: "tatu_wrap", title: "Татуаж"}
    {anchor: "piercing_wrap", title: "Пирсинг"}
    {anchor: "contact_wrap", title: "Контакты"}
    ]

  $scope.goScreen = (id_screen) ->
    console.log "have to go to ", id_screen
    elm_screen = document.getElementById id_screen
    console.log "elem", elm_screen
    $document.scrollToElementAnimated elm_screen
    return true