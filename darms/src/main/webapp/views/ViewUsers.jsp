<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | View Users</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/base-responsive.css" />
    <link rel="stylesheet" href="css/animate.min.css" />
    <link rel="stylesheet" href="css/slicknav.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <script src="vendor/charts/Chart.js"></script>
    <script src="vendor/charts/moment.min.js"></script>

    <style>
    	body {
			background-color: #fff;
		}

		.b-leftmenu ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}
		.b-leftmenu ul li {
		  /* Sub Menu */
		}
		.b-leftmenu ul li a {
			display: block;
			background: #ebebeb;
			padding: 10px 15px;
			color: #333;
			text-decoration: none;
			-webkit-transition: 0.2s linear;
			-moz-transition: 0.2s linear;
			-ms-transition: 0.2s linear;
			-o-transition: 0.2s linear;
			transition: 0.2s linear;
		}
		.b-leftmenu ul li a:hover {
			background: #f8f8f8;
			color: #515151;
		}
		.b-leftmenu ul li a .fa {
			width: 16px;
			text-align: center;
			margin-right: 5px;
			float:right;
		}
		.b-leftmenu ul ul {
			background-color:#ebebeb;
		}
		.b-leftmenu .sub-menu ul li a {
			background: #f8f8f8;
			border-left: 4px solid transparent;
			padding: 10px 25px;
		}
		.b-leftmenu .sub-sub-menu ul li a {
			padding: 10px 20px 10px 40px;
		}
		.b-leftmenu a.b-newpage:hover {
			background: #ebebeb;
			border-left: 4px solid #3498db;
		}
		.text-nowrap {
		  white-space: unset !important;
		}
    </style>
</head>


<body>
	
	<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#">Logo</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="#">Link</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Link</a>
			</li>
		</ul>
	</nav> -->



	<div class="d-flex" id="wrapper">

    <jsp:include page="SideBar.jsp"></jsp:include>

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <jsp:include page="Header.jsp"></jsp:include>

      <!-- Breadcrumb -->
      <ul class="breadcrumb">
          <li><a href="/dashboard">Dashboard</a></li>
          <li>View Users</li>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6 col-sm-6 col-xs-6">
	        	<h3 class="mt-4" style="font-size:32px;">View Users</h3>
	       	</div>
	        <div class="col-md-6 col-sm-6 col-xs-6">
	        	<a href="/add_user" class="btn btn-danger mt-4" style="float:right">Add New</a>
	       	</div>
	    </div>
	    
	    <div class="row">
			<div class="col-md-12 p-4">
				<form action="/view_users" method="post" class="w-sm-50 w-auto mx-auto">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Tehsil</label>
					          	<select name="tehsil_code" class="form-control">
									<option value="">????????? ?????????</option>
									<c:forEach var="tehsil" items="${tehsillist}">
							       		<option ${tehsil_code == tehsil.getTehsilCodeCensus()? 'selected' : ''} value="${tehsil.getTehsilCodeCensus()}">${tehsil.getTname()} (${tehsil.getTnameEng()})</option>   
							   		</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>User Id</label>
					          	<input type="text" class="form-control" name="user_id" value="${user_id!=Null? user_id : ''}" placeholder="Enter user id">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Mobile Number</label>
					          	<input type="text" class="form-control" name="mobile_no" value="${mobile_no!=Null? mobile_no : ''}" placeholder="Enter mobile number">
							</div>
						</div>
						<div class="col-md-1">
							<label>&nbsp;</label>
				          	<button class="form-control btn btn-danger">Filter</button>
						</div>
					</div>
	          	</form>
			</div>
		</div>
        
        <!-- Charts -->
        <div class="row">
        	<div class="col-md-12 p-4 table-responsive">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
        		<table class="table table-striped text-nowrap">
					<thead>
						<tr>
							<th>User Id</th>
							<th>User Name</th>
							<th>Mobile No.</th>
							<th>Role</th>
							<th>User of</th>
							<th>Section/Division</th>
							<th>District</th>
							<th>Tehsil</th>
							<th>Created At</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="val" items="${pagedata}" varStatus="counter">
						<tr>
							<td>${val.getUser_id()}</td>
							<td>${val.getName()}</td>
							<td>${val.getMobile()}</td>
							<td>${val.getRolename()}</td>
							<td>${val.getUsertype()}</td>
							<td>${val.getLogintype()}</td>
							<td><c:if test="${val.getDistrict_name() != '' && val.getDistrict_name() != null}"> 
							${val.getDistrict_name()} (${val.getDistrict_name_hindi()})
							</c:if></td>
							<td><c:if test="${val.getTname_eng() != '' && val.getTname_eng() != null}"> 
							${val.getTname_eng()} (${val.getTname()})
							</c:if></td>
							
							<td><fmt:parseDate value="${val.getCreated_at()}" pattern="yyyy-MM-dd HH:mm" var="myDate"/>
							<fmt:formatDate pattern = "dd-MM-yyyy hh:mm a" value = "${myDate}" /></td>
							<td><a href="/edit_user?id=${val.getId()}">Edit</a></td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<c:if test="${pagedata.size() > 0 }">
			        <div class="panel-footer">
			            <p>Showing page no. ${number+1} of ${pagedata.size()} records from ${totalElements} total records</p>
			            <ul class="pagination">
			                <c:forEach begin="0" end="${totalPages-1}" var="page">
			                    <li class="page-item">
			                        <a href="view_users?page=${page+1}&size=${pagedata.size()}${tehsil_code!=''? '&tehsil_code=' += tehsil_code : ''}${user_id!=''? '&user_id=' += user_id : ''}${mobile_no!=''? '&mobile_no=' += mobile_no : ''}" class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
			            </ul>
			        </div>
			    </c:if>
			    
        	</div>
        </div>        
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->



  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="js/jquery.slicknav.min.js"></script>
  <script src="js/dashboard.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

 
  <script>
  	$(document).ready(function(){ 
	    $('#backtotop').click(function(){ 
	        $("html, body").animate({ scrollTop: 0 }, 600); 
	        return false; 
	    }); 
	});
  </script>


  <script>
  	$('.sub-menu ul').hide();
  	$('.sub-sub-menu ul').hide();
	$(".sub-menu a").click(function () {
		$(this).parent(".sub-menu").children("ul").slideToggle("100");
		$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
	});

	$(".sub-sub-menu a").click(function () {
		$(this).parent(".sub-sub-menu").children("ul").slideToggle("100");
		$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
	});
  </script>


 	<!-- Signup Modal -->
	<div class="modal fade" id="signout-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h3 class="modal-title">Sign Out?</h3>
					<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p class="text-center">Are you sure you want to Sign Out?</p>
					<div class="text-center py-4">
						<form action="/logout">
							<button type="submit" class="btn btn-primary b-btn mx-3">Sign Out</button>
							<button class="btn btn-secondary mx-3" data-dismiss="modal">Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>

