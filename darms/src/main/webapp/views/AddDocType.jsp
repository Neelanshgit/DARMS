<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | Add Document Type</title>
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
          <c:choose>
		    <c:when test = "${doctypedata.id == Null || doctypedata.id == ''}">
		        <li>Add Document Type</li>
		    </c:when>    
		    <c:otherwise>
		        <li>Update Document Type</li>
		    </c:otherwise>
		  </c:choose>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6">
	      		<c:choose>
				    <c:when test = "${doctypedata.id == Null || doctypedata.id == ''}">
				        <h3 style="font-size:32px;">Add Document Type</h3>
				    </c:when>    
				    <c:otherwise>
				        <h3 style="font-size:32px;">Edit Document Type</h3>
				    </c:otherwise>
				</c:choose>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-sm-4">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
        		<form:form action="/submit_doc_type" modelAttribute="doctypeEntry" method="post" class="w-sm-50 w-auto mx-auto">
                	<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label for="code">Document Type Code: </label>
								<c:choose>
								    <c:when test = "${doctypedata.id == Null || doctypedata.id == ''}">
								        <input type="hidden" name="id" value="0">
								    </c:when>    
								    <c:otherwise>
								        <input type="hidden" name="id" value="${doctypedata.id}">
								    </c:otherwise>
								</c:choose>
								<input type="number" min="1" class="form-control" name="code" value="${code!=Null? code : (doctypedata.code!=Null? doctypedata.code : '')}" placeholder="Enter Document Type Code">
								<form:errors path="code" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Document Type Name: </label>
								<input type="text" class="form-control" name="name" value="${name!=Null? name : (doctypedata.name!=Null? doctypedata.name : '')}" placeholder="Enter Document Type Name">
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="type">Type: </label><br>
								<label><input type="radio" name="type" value="D" ${type=="D"? 'checked' : (doctypedata.type=="D"? 'checked' : '')}> District</label>
								&nbsp;&nbsp;&nbsp;<label><input type="radio" name="type" value="T" ${type=="T"? 'checked' : (doctypedata.type=="T"? 'checked' : '')}> Tehsil</label>
								<br>
								<form:errors path="type" cssClass="error" />
							</div>
						</div>
					</div>
					<c:choose>
					    <c:when test = "${doctypedata.id == Null || doctypedata.id == ''}">
					        <button type="submit" class="btn btn-primary b-btn">Submit</button>
					    </c:when>    
					    <c:otherwise>
					        <button type="submit" class="btn btn-primary b-btn">Update</button>
					    </c:otherwise>
					</c:choose>
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
