<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | Add Document</title>
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
		.error {
			color:red;
			font-size: 12px;
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
          <li>Storage Information</li>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6 col-sm-6 col-xs-6">
	        	<h3 style="font-size:32px;">Storage Information</h3>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-sm-4">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
        		<form:form action="/submit_storage_info" modelAttribute="storageEntry" method="post" class="w-sm-50 w-auto mx-auto">
                	<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label for="total_compactors">Total No. of Compactors: </label>
								<input type="hidden" name="districtCode" value="${sessionScope.districtCode}">
								<input type="hidden" name="tehsilCode" value="${sessionScope.tehsilCode}">
								<input type="number" class="form-control" name="total_compactors" value="${total_compactors!=Null? total_compactors : (storagedata.total_compactors!=Null? storagedata.total_compactors : 0)}" placeholder="Enter no. of compactors">
								<form:errors path="total_compactors" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="total_racks">Total No. of Racks (Per Compactor): </label>
								<input type="number" class="form-control" name="total_racks" value="${total_racks!=Null? total_racks : (storagedata.total_racks!=Null? storagedata.total_racks : 0)}" placeholder="Enter total no. of racks (per compactor)">
								<form:errors path="total_racks" cssClass="error" />
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="total_bundles">Total No. of Bundles (Per Rack): </label>
								<input type="number" class="form-control" name="total_bundles" value="${total_bundles!=Null? total_bundles : (storagedata.total_bundles!=Null? storagedata.total_bundles : 0)}" placeholder="Enter total no. of bundles (per rack)">
								<form:errors path="total_bundles" cssClass="error" />
							</div>
						</div>
					</div>
					
					<button type="submit" class="btn btn-primary b-btn">Submit</button>
				</form:form>
        	</div>
        </div>        
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <jsp:include page="Footer.jsp"></jsp:include>
  
</body>
</html>
