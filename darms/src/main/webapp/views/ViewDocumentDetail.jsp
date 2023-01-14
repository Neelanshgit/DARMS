<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | View Document Detail</title>
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
          <li>View Document Detail</li>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6">
	        	<h3 style="font-size:32px;">View Document Detail</h3>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-sm-5">
                <form method="post" action="/verify_document" class="w-sm-50 w-auto mx-auto">
					<h4>Document Detail</h4>
					<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label>Document Type:</label>
								<input type="hidden" name="sel" value="${documentdata.getId()}">
								<input type="hidden" name="doc_status" value="A">
								<input type="text" class="form-control" value="${documentdata.getName()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Pages(From-To):</label>
								<input type="text" class="form-control" value="${documentdata.getStart_page()} - ${documentdata.getEnd_page()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Total Pages:</label>
								<input type="text" class="form-control" value="${documentdata.getTotal_pages()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Village Name:</label>
								<input type="text" class="form-control" value="${documentdata.getVname_eng()} (${documentdata.getVname()})" readonly>
							</div>
						</div>
					</div>
						
					<h4>Land Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Fasli Year:</label>
								<input type="text" class="form-control" value="${documentdata.getFasli_year()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Khasra Number:</label>
								<input type="text" class="form-control" value="${documentdata.getKhasra_number()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Owner Name:</label>
								<input type="text" class="form-control" value="${documentdata.getOwner_name()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Father's/Guardian Name:</label>
								<input type="text" class="form-control" value="${documentdata.getFather_name()}" readonly>
							</div>
						</div>
					</div>
					
					<h4>Storage Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Compactor No.:</label>
								<input type="text" class="form-control" value="${documentdata.getCompactor_no()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Rack No.:</label>
								<input type="text" class="form-control" value="${documentdata.getRack_no()}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Bundle No.:</label>
								<input type="text" class="form-control" value="${documentdata.getBundle_no()}" readonly>
							</div>
						</div>
					</div>
					<h4>File Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>File upload:</label><br>
								<a href="/files/${documentdata.getFile_name()}" target="_blank">Show Document PDF</a> 
								<!-- <input type="file" name="upload" class="form-control-file border"> -->
							</div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Approve</button>&nbsp; &nbsp; &nbsp;<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#verify-modal">Reject</button>
				</form>
        	</div>
        </div>        
      </div>
    </div>
    <!-- /#page-content-wrapper -->
    
    <div class="modal fade" id="verify-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-3 border-bottom-0">
					<h3 class="modal-title">Reject Document?</h3>
					<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="py-4">
						<form method="post" action="/verify_document" id="VerificationForm">
							<input type="hidden" name="sel" value="${documentdata.getId()}">
							<input type="hidden" name="doc_status" value="R">
							<div class="form-group">
								<label for="comment">Remark:</label>
								<textarea class="form-control" rows="3" id="comment" style="resize: none;" placeholder="Enter remark"></textarea>
							</div>
							<button type="submit" class="btn btn-primary b-btn mx-3">Reject</button>
							<button class="btn btn-secondary mx-3" data-dismiss="modal">Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

  </div>
  <!-- /#wrapper -->
	
  <jsp:include page="Footer.jsp"></jsp:include>
	
</body>
</html>
