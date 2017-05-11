var app = angular.module('myApp',[]);

app.directive('ngFiles', ['$parse', function ($parse) {

    function fn_link(scope, element, attrs) {
        var onChange = $parse(attrs.ngFiles);
        element.on('change', function (event) {
            onChange(scope, { $files: event.target.files });
        });
    };

    return {
        link: fn_link
    }
} ]);

app.controller('ContactController', ['$scope','$window', function($scope,$window) {

	$scope.feedback = {firstName:"", lastName:"",error:""};
    
	/*$scope.process = function(location){
		console.log("loc "+location);
		 $http({
             method: 'POST',
             url: '/SpringSecurity-MongoDB-MVC/link',
             data: $scope.location,
             headers: {
                 'Content-Type': 'application/text',
                 'Accept':'application/text',
               }
                
                 
         })  
         .success(function(data, status,response){
         	
         	alert("File successfully exported");
         	//console.log(data);
         	
         })
         .error(function(data, status){
             // login failure
        
    	});
		 
		 
	};*/
	
	$scope.sendFeedback = function() {
		//console.log("heyy");
		if (($scope.feedback.firstName=="mylister" && $scope.feedback.lastName == "mylister")||($scope.feedback.firstName=="admin" && $scope.feedback.lastName == "admin")) {
			//console.log("correct");
			$scope.feedback.error='';
			$window.location.href = 'menu';
			//console.log("1correct");

		}
		else {
			$scope.feedback = {firstName:"", lastName:""};
			$scope.feedbackForm.$setPristine();
			$scope.feedback.error = 'Incorrect username/password !';
			//console.log("incorrect");
		}
	};

}])

;
app.controller('TabsCtrl', ['$scope','$http','$window',function ($scope,$http,$window) {
	
	// console.log("in1");
    $scope.tabs = [{
            title: 'Forum 4U',
            url: 'better.html'
        }/*,{
    title: 'e-Sat',
    url: 'esat.html'
}*/];
    
    $scope.names = [{
        title: 'Organisation',
        url: 'organisation.html'
    },{
       title: 'Team',
       url: 'team.html'
   }];
       

    $scope.currentTab = 'better.html';

    $scope.onClickTab = function (tab) {
        $scope.currentTab = tab.url;
    }
    
    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }
    
    var formdata = new FormData();
    $scope.getTheFiles = function ($files) {
    	
        angular.forEach($files, function (value, key) {
            formdata.append(key, value);
            //alert("key:"+key+"value:"+value);
        });
    };
    
    
    $scope.complaint = {title:"", comment:""};
    
    $scope.loading=false;
    $scope.toggle = function (complaintForm) {
    	
    	 formdata.append("title",$scope.complaint.title);
    	 formdata.append("comment",$scope.complaint.comment);
    	 //console.log(formdata);
    	$scope.loading=true;
    	 $http({
             method: 'POST',
             url: '/sample/link',
            // data:  {title: $scope.complaint.title, comment:$scope.complaint.comment,file:formdata},
             data:formdata,
             headers: {
                 'Content-Type': undefined,
                 'Accept':'application/text',
               },
               transformRequest: angular.identity
                
                 
         })  
         .success(function(data, status,response){
         	
        	complaintForm.$setPristine();
        	$scope.complaint.title="";
        	$scope.complaint.comment="";
        	
         	//alert("Your response submitted successfully");
        	$window.location.href = 'success';
         	$scope.loading=false;
         	//console.log(data);
         	
         })
         .error(function(data, status){
             // login failure
        	// alert("error");
    	});
		 
    
	};
    	
    	
	
	   	
}]);

app.controller("DragController",['$scope','$window', function($scope,$window) {
 
	    
	    $scope.tab = 1;

	    $scope.setTab = function(newTab){
	      $scope.tab = newTab;
	    };

	    $scope.isSet = function(tabNum){
	      return $scope.tab === tabNum;
	    };
  	 
}]);



