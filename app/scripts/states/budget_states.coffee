angular.module('states.budget', ['controllers.buckets'])
.config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $stateProvider.state('budgets',
    url: '/budgets/:id'
    views:
      'main':
        templateUrl: '/views/budgets/budget.show.html'
        controller: (['$scope', '$state', ($scope, $state)->
        ]) #end controller
  ) #end state
  .state('budgets.buckets',
    url: '/buckets'
    views:
      'bucket-list':
        templateUrl: '/views/buckets/buckets.list.html'
        controller: (['$scope', '$rootScope', '$state', "Bucket", ($scope, $rootScope, $state, Bucket)->
          Bucket.query(budget_id: $state.params.id, (response)->
            $scope.buckets = response
          )
          $rootScope.channel.bind('bucket_created', (bucket) ->
            $scope.buckets.unshift bucket.bucket
            $scope.$apply()
          )
        ]) #end controller
       'sidebar@':
         template: '<h1>sidebar</h1>'
  ) #end state
  .state('budgets.propose_bucket',
    url: '/propose-bucket'
    views:
      'bucket-create':
        templateUrl: '/views/buckets/buckets.create.html'
        controller: 'BucketController'
      'sidebar@':
        template: '<h1>Instructions</h1>'
  ) #end state
]) #end config
