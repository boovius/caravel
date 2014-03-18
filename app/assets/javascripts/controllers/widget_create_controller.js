Caravel.controller('WidgetCreateController', ['$scope', 'WidgetService', '$window', function($scope, widgetService, $window) {

  $scope.widget = {
    title: gon.currentUser.name + "'s new widget",
    userId: gon.currentUser.id,
    features: []
  }

  $scope.addNewFeature = function(){
    $scope.widget.features.push({})
  }

  $scope.deleteFeature = function(index){
    $scope.widget.features.splice(index)
  }

  $scope.createwidget = function(){
    WidgetService.widgets.save(angular.snakeize($scope.widget), function(newWidget){
      $window.location.href = '/widgets/' + newWidget.id
    }, function(errorData){
      console.log(erroData.messages)
      alert('Sorry, there was an error creating your widget')
    })
  }
}])
