Caravel.controller('WidgetShowController', ['$scope', 'widget', '$routeParams', function($scope, widget, $routeParams) {
  $scope.widget = widget.widget
  $scope.currentUser = gon.currentUser

}])
