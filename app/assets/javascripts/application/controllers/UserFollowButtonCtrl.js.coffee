Annict.angular.controller 'UserFollowButtonCtrl', ($scope, $http, $analytics) ->
  $scope.init = (isFollowing, type) ->
    $scope.isFollowing = isFollowing
    $scope.type = type

  $scope.setFollowButtonText = ->
    followIcon    = '<i class="fa fa-plus" />'
    followingIcon = '<i class="fa fa-minus" />'

    switch $scope.type
      when 'text'
        if $scope.isFollowing
          "#{followingIcon}フォロー中"
        else
          "#{followIcon}フォロー"
      when 'icon'
        if $scope.isFollowing then followingIcon else followIcon

  $scope.toggle = (userId) ->
    if $scope.isFollowing
      $http.delete("/users/#{userId}/unfollow").success (data) ->
        $analytics.eventTrack('アンフォロー', { category: 'follows' })
        $scope.isFollowing = false
        $scope.setFollowButtonText()
    else
      $http.post("/users/#{userId}/follow").success (data) ->
        $analytics.eventTrack('フォロー', { category: 'follows' })
        $scope.isFollowing = true
        $scope.setFollowButtonText()
