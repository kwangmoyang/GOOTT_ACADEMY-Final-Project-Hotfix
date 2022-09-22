const linkcopy = document.querySelectorAll('.linkcopy');
const tooltip = document.querySelectorAll('.tooltip');
const tooltiptwo = document.querySelectorAll('.tooltiptwo');

// tooptip 효과

//***마우스를 올렸을 때 이벤트 작동이 조금 불안정한듯함***
for(let i=0; i<linkcopy.length; i++)
{
    /**링크 아이콘에 마우스를 올렸을 때 작동하는 이벤트 */
    linkcopy[i].addEventListener('mouseover', function(){
        tooltip[i].classList.add('ani');
        tooltip[i].style.opacity = '1';
    })
}

for(let i=0; i<linkcopy.length; i++)
{
    /**링크 아이콘에 마우스를 out했을 때 작동하는 이벤트 */
    linkcopy[i].addEventListener('mouseout', function(){
        tooltip[i].classList.remove('ani');
        tooltip[i].style.opacity = '0';
        tooltiptwo[i].style.opacity = '0';
    })

}

for(let i=0; i<tooltip.length; i++)
{
    /**링크 아이콘에 마우스를 click했을 때 작동하는 이벤트 */
    linkcopy[i].addEventListener('click', function(){
        tooltiptwo[i].style.opacity = '1';
        tooltip[i].style.opacity = '0';
    })
}


// 페이징
var app = angular.module("DemoApp", ['ngMaterial', 'cl.paging']);
app.controller("MainController", ['$scope', function($scope) {

  $scope.currentPage = 0;

  $scope.paging = {
    total: 100,
    current: 1,
    onPageChanged: loadPages,
  };

  function loadPages() {
    console.log('Current page is : ' + $scope.paging.current);

    // TODO : Load current page Data here

    $scope.currentPage = $scope.paging.current;
  }

}]);