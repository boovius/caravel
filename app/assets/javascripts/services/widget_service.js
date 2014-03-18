Caravel.factory('WidgetService', ['$resource', function($resource) {
  return {
    widgets: $resource('/api/widgets'),
    widget:  $resource('/api/widgets/:id', {id: '@id'}, {
      update: {method: 'PUT'}
    })
  }
}])
