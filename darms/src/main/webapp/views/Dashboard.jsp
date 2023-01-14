<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>DARMS | Dashboard</title>
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
	<script src="vendor/charts/Chart.min.js"></script>
	<script src="vendor/charts/utils.js"></script>
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

      <div class="container-fluid">
      	<div class="d-flex clearfix mt-4">
      		<h3 class="d-inline-block" style="font-size:32px;">Dashboard</h3>
      		<!-- <span class="ml-auto d-inline-block align-self-center"><button type="button" class="btn btn-primary b-btn"><span class="fas fa-download fa-sm"></span> Result</button></span> -->
      	</div>


        
		</div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->
  
  <jsp:include page="Footer.jsp"></jsp:include>

  <script src="vendor/jquery-ui/jquery-ui.js"></script>
  <!-- <script>
	  $(function() {
        $( "#sortable-menu").sortable();
        $( "#sortable-menu").disableSelection();

        $( "#sortable-cards").sortable();
        $( "#sortable-cards").disableSelection();
      });
  </script> -->
  <script>
  $(function() {
    $("#one-item-row").on("click", function() {
    	$(".b-customize").addClass("col-lg-12", 300);
    	$(".b-customize").removeClass("col-lg-4", 300);
    	$(".b-customize").removeClass("col-lg-6", 300);
    });

    $("#two-item-row").on("click", function() {
    	$(".b-customize").addClass("col-lg-6", 300);
    	$(".b-customize").removeClass("col-lg-4", 300);
    	$(".b-customize").removeClass("col-lg-12", 300);
    });

    $("#three-item-row").on("click", function() {
    	$(".b-customize").addClass("col-lg-4", 300);
    	$(".b-customize").removeClass("col-lg-6", 300);
    	$(".b-customize").removeClass("col-lg-12", 300);
        
    });
 
  });
  </script>

	
</body>
</html>