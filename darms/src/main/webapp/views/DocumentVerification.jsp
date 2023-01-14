<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | Document Verification</title>
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
		.table {
			font-size:14px;
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
          <li>Document Verification</li>
      </ul>
      
      <div class="container-fluid">
        <h3 style="font-size:32px;">Document Verification <a class="btn btn-info" style="float:right" href="javascript:void(0);" data-toggle="modal" data-target="#verify-modal">Verify Selected</a></h3>
        
        <form method="post" action="/verify_document" id="VerificationForm">
        <div class="modal" id="verify-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header text-center d-block p-3 border-bottom-0">
						<h3 class="modal-title">Verify Selected Documents</h3>
						<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div class="py-4">
							<div class="form-group">
								<label for="comment">Select:</label>
								<select class="form-control" name="doc_status">
									<option value="A">Approve</option>
									<option value="R">Reject</option>
								</select>
							</div>
							<div class="form-group">
								<label for="comment">Remark:</label>
								<textarea name="remark" class="form-control" rows="3" id="comment" style="resize: none;" placeholder="Enter remark"></textarea>
							</div>
							<button type="submit" class="btn btn-primary b-btn mx-3">Submit</button>
							<button class="btn btn-secondary mx-3" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
        
        <!-- Charts -->
        <div class="row">
        	<div class="col-md-12 p-4">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
			    <div class="table-responsive">
        		<table class="table table-striped text-nowrap">
					<thead>
						<tr>
							<th><input type="checkbox" name="selectAll" id="selectAll"> Select All</th>
							<th style="width:20%">Type</th>
							<th>Pages(From-to)</th>
							<th>Total Pages</th>
							<th style="width:20%">Village</th>
							<th>Fasli Year</th>
							<th>Khasra No.</th>
							<th>Owner Name</th>
							<th>Guardian Name</th>
							<th>Storage Location</th>
							<th>Created By</th>
							<th>Created At</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="val" items="${pagedata}" varStatus="counter">
						<tr>
							<td><input type="checkbox" name="sel" value="${val.getId()}"></td>
							<td>${val.getName()}</td>
							<td>${val.getStart_page()} - ${val.getEnd_page()}</td>
							<td>${val.getTotal_pages()}</td>
							<td>${val.getVname_eng()} (${val.getVname()})</td>
							<td>${val.getFasli_year()}</td>
							<td>${val.getKhasra_number()}</td>
							<td>${val.getOwner_name()}</td>
							<td>${val.getFather_name()}</td>
							<td>Compactor:${val.getCompactor_no()} Rack:${val.getRack_no()} Bundle:${val.getBundle_no()}</td>
							<td>${val.getUsername()}</td>
							<td><fmt:parseDate value="${val.getCreated_at()}" pattern="yyyy-MM-dd HH:mm" var="myDate"/>
							<fmt:formatDate pattern = "dd-MM-yyyy hh:mm a" value = "${myDate}" /></td>
							<td><a href="/view_document_detail?id=${val.getId()}">View</a></td>
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
			                        <a href="document_verification?page=${page+1}&size=${pagedata.size()}" class="page-link">${page+1}</a>
			                    </li>
			                </c:forEach>
			            </ul>
			        </div>
			    </c:if>
				</div>
        	</div>
        </div>
        </form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

 <jsp:include page="Footer.jsp"></jsp:include>
	
</body>
</html>

