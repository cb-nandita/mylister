<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html lang="en" ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyLister</title>
<script type="text/javascript"
	src="<c:url value='/assets/scripts/jquery-1.10.2.min.js'/>"></script>
<%-- <script type="text/javascript"
	src="<c:url value='/assets/bower_components/angular/angular.min.js'/>"></script> --%>
<script type="text/javascript"
	src="<c:url value='/assets/scripts/angular.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/assets/bower_components/angular/angular-drag-and-drop-lists.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/assets/scripts/app.js'/>"></script>

<link rel="stylesheet" media="screen"
	href="<c:url value='/assets/styles/bootstrap.min.css'/>">
<link rel="stylesheet" media="screen"
	href="<c:url value='/assets/styles/bootstrap-theme.min.css'/>">
<link rel="stylesheet" media="screen"
	href="<c:url value='/assets/bower_components/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet" media="screen"
	href="<c:url value='/assets/styles/mystyles.css'/>">
<link rel="stylesheet" media="screen"
	href="<c:url value='/assets/styles/simple.css'/>">
	
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/css/material.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.1/js/material.min.js"></script>

<style>
.tabs_check {
	list-style: none;
	padding: 0;
	margin: 0;
}

.list_check {
	float: left;
	border-bottom-width: 0;
	margin: 3px 3px 0px 3px;
	padding: 5px 5px 0px 5px;
	background-color: #fff;
	color: #696969;
	padding: 12px 56px;
	margin-bottom: -1px;
	
}

#mainView {
	clear: both;
	padding: 0 1em 6em;
	border: 1px solid #eee;
	margin: 3px;
}

.active {
	background-color: #47bac1;
	color: #fff;
	border: 1px solid #47bac1 ;
	border-bottom: none;
	border-radius:4px;

}

#pointer_check td{
   cursor: pointer; 
   cursor: hand;
}

.export_button{
  color:#fff;
  background-color:#45A4C0;
  border-color:#000;
  border-radius: 4px;
  padding: 2px 14px;
}


.form-control-wrapper{
   border-color:#757575 !important;
}

body {
    background-color: #fff;
}

.material-input::after{
   color: #009587 !important;

}

.header_page{

  box-sizing: border-box;
    z-index: 99999;
    overflow: hidden;
    color: #ffffff;
    width: 100%;
    background-color:#1c324a;
    height:80px;
    top:0;
    position:fixed;
     left:0;
}


.footer_page{

  box-sizing: border-box;
    z-index: 99999;
    overflow: hidden;
    color: #ffffff;
    width: 100%;
    background-color: #1c324a;
    height:60px;
    bottom:0;
    position:fixed;
     left:0;
}

.loading {
	background-color: #EFEFEF;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 1000;
	top: 0px;
	left: 0px;
	opacity: .6;
	filter: alpha(opacity = 50);
}

.footercontainer{
width: 960px;
    margin: 0 auto;
    float: left;
    padding-left:90px;
    padding-top:18px;
    font-size:11px;
}

.container{
	margin-top : 50px;
}



</style>

</head>
<body>
				<!-- <a ng-href="login" style="margin-left:1068px;text-decoration:none;" class="export_button">Logout</a -->
				 <div class="header_page">

		<div class="left" style="margin-left: 44px; margin-top: 9px;margin-left:20px;">
			<div class="col-xs-2">
				<div class="col-xs-1">
					<a href="welcome" style="text-decoration: none; color: inherit;"><i
						class="fa fa-home fa-3x" aria-hidden="true"></i></a>
				</div>
				<div class="col-xs-1 col-xs-offset-1" style="margin-top: 6px;">
					<img class="rsysLogo" src="assets/images/lister_logo.png"
						width="160px">
				</div>
			</div>
		</div>
	</div>


		
	<div class="container">
		<div class="row">
			
		</div>
		<div ng-controller="TabsCtrl">
			<div>
				<div id="tabs">
					<ul class="tabs_check">

						<li ng-repeat="tab in tabs"
							ng-class="{active:isActiveTab(tab.url)}"
							ng-click="onClickTab(tab)"  class="list_check" >{{tab.title}}</li>
					</ul>
					<div id="mainView">
						<div ng-include="currentTab" style="height:320px;"></div>
					</div>
				</div>
				
				<script type="text/ng-template" id="better.html">
         <div class="row" id="viewOne" style="margin-top:15px;margin-left:50px;">
			<div class="col-xs-12 col-sm-9">
				<form class="form-horizontal" name="complaintForm"
					method="post" action="sendEmail.do" enctype="multipart/form-data">
					<div class="form-group" 
						ng-class="{ 'has-error' : complaintForm.title.$error.required && !complaintForm.title.$pristine }" style="margin-bottom:5px;">						
                           <label>Title</label>
                           <div class="form-control-wrapper">
							<input type="text" class="form-control" id="title"
								name="title" placeholder="Subject"
								ng-model="complaint.title" required> 
                              <small
								ng-show="complaintForm.title.$error.required && !complaintForm.title.$pristine"
								class="help-block">Title required.</small>
						</div>
					</div>
					<div class="form-group"
						ng-class="{ 'has-error' : complaintForm.comment.$error.required && !complaintForm.comment.$pristine }" style="margin-bottom:5px;">
						<label>Message</label>
                         <div class="form-control-wrapper">
							<textarea rows="4" cols="50"  class="form-control" id="comment"
								name="comment" placeholder="Enter your comments here"
								ng-model="complaint.comment" required></textarea> 
                             <small
								ng-show="complaintForm.comment.$error.required && !complaintForm.comment.$pristine"
								class="help-block">Comment required.</small>
						   </div>
					</div>
                    <div class="form-group" style="margin-bottom:6px;">
						<label>Attachment(Optional)</label>
                         <input type="file" name="attachFile" size="60" accept="image/*,.doc,.docx,application/msword,.txt" style="margin-bottom:5px;"/>
                         <span style="font-size:9px;font-style:italic;">File types allowed:.doc,.docx,.txt ,all image formats</span>
					</div>
			       <div class="loading" ng-show="loading"><div style="margin-left:500px;margin-top:250px;"><img src="assets/images/31.gif"><b>&nbsp;&nbsp;Sending your message</b>
                                               </div></div> 
                        
                   <button type="submit" ng-disabled="complaintForm.$invalid"  class="btn" style="background-color: #47bac1 !important;color:#fff;margin-left:-15px;">Send</button>
                       
                   	<div class="row">
                      <span style="font-size:11px;font-style:italic;">All comments posted above will be anonymously emailed only to ashok.rajan@listerdigital.com</span>
                       </div>		
					
				</form>
			</div>
		</div>
	</script>
    <script type="text/ng-template" id="esat.html">
   <div id="viewTwo" style="margin-top:12px;" ng-controller="DragController">
    <div class="simpleDemo row" style="margin-top:12px;">
     <div class="col-md-2">
  		<ul class="nav nav-pills nav-stacked">
       	<li ng-class="{ active: isSet(1) }">
          	<a href ng-click="setTab(1)">Organisation</a>
       	</li>
       	<li ng-class="{ active: isSet(2) }">
          	<a href ng-click="setTab(2)">Team</a>
       	</li>
     	</ul>
  	</div>
    <div class="col-md-8">
  		
       	<div ng-show="isSet(1)">
         	<div class="col-md-3">
             Satisfaction Level
         	</div>
            <div class="col-md-9">
                 <div class="col-sm-2">Infrastructure</div>
                           <div class="col-sm-8">
							<input type="range" name="range" ng-model="value" min="1"  max="10">{{value}}
				</div>
         	</div>
        	</div>
			<div ng-show="isSet(2)">
          <h1>Profile page</h1>
          <p>Profile information</p>
     	</div>
 
  
	</div>
					
					
			
    </div>
    </div>		
	</script>

			</div>

		</div>




	</div>
	<div class="footer_page">
				
						<div class="footercontainer">
                       <p>© Lister Technologies, 2017. All rights reserved.</p>
                     </div>
					
				</div> 

</body>

</html>