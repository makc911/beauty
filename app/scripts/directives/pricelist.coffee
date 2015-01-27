angular.module('beautyApp').directive 'priceList', () ->

  return {
  restrict: 'AE'
  templateUrl: '/views/directives/pricelist.html'
  replace: true
  scope:
    list: "="

  link: (scope, element, attrs) ->
    scope.isPriceShow = false

    scope.showPrise = () ->
      scope.isPriceShow = !scope.isPriceShow


  }