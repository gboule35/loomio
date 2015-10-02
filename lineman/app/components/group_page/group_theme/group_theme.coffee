angular.module('loomioApp').directive 'groupTheme', ->
  scope: {group: '=', homePage: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/group_theme/group_theme.html'
  replace: true
  controller: ($scope, CurrentUser, AbilityService, ModalService, CoverPhotoForm, LogoPhotoForm) ->

    $scope.logoStyle = ->
      { 'background-image': "url(#{$scope.group.logoUrl()})" }

    $scope.coverStyle = ->
      { 'background-image': "url(#{$scope.group.coverUrl()})" }

    $scope.isMember = ->
      CurrentUser.membershipFor($scope.group)?

    $scope.canUploadPhotos = ->
      AbilityService.canAdministerGroup($scope.group)

    $scope.openUploadCoverForm = ->
      ModalService.open CoverPhotoForm, group: => $scope.group

    $scope.openUploadLogoForm = ->
      ModalService.open LogoPhotoForm, group: => $scope.group
