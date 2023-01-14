<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | Add Menu</title>
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
		    <c:when test = "${menudata.id == Null || menudata.id == ''}">
		        <li>Add Menu</li>
		    </c:when>    
		    <c:otherwise>
		        <li>Edit Menu</li>
		    </c:otherwise>
		  </c:choose>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6">
	      		<c:choose>
				    <c:when test = "${menudata.id == Null || menudata.id == ''}">
				        <h3 style="font-size:32px;">Add Menu</h3>
				    </c:when>    
				    <c:otherwise>
				        <h3 style="font-size:32px;">Edit Menu</h3>
				    </c:otherwise>
				</c:choose>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-sm-4">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
        		<form:form action="/submit_menu" modelAttribute="menuEntry" method="post" class="w-sm-50 w-auto mx-auto">
                	<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label for="code">Parent Menu: </label>
								<c:choose>
								    <c:when test = "${menudata.id == Null}">
								        <input type="hidden" name="id" value="0">
								    </c:when>    
								    <c:otherwise>
								        <input type="hidden" name="id" value="${menudata.id}">
								    </c:otherwise>
								</c:choose>
								<select name="parent_id" class="form-control" id="select2">
									<option value="0">चयन करे</option>
									<c:forEach var="option" items="${menuoptions}">
							       		<option ${menuEntry.getParent_id() == option.getId()? 'selected' : (menudata.parentId == option.getId()? 'selected' : '')} value="${option.getId()}">${option.getName()}</option>   
							   		</c:forEach>
								</select>
								<form:errors path="parent_id" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Menu (Hindi): </label>
								<input type="text" class="form-control" name="name" value="${menuEntry.getName()!=Null? menuEntry.getName() : (menudata.name!=Null? menudata.name : '')}" placeholder="Enter Menu(Hindi)">
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Menu (English): </label>
								<input type="text" class="form-control" name="name_eng" value="${menuEntry.getName_eng()!=Null? menuEntry.getName_eng() : (menudata.nameEng!=Null? menudata.nameEng : '')}" placeholder="Enter Menu(Eng)">
								<form:errors path="name_eng" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Mapped Url: </label>
								<input type="text" class="form-control" name="mapped_url" value="${menuEntry.getMapped_url()!=Null? menuEntry.getMapped_url() : (menudata.mappedUrl!=Null? menudata.mappedUrl : '')}" placeholder="Enter Mapped Url">
							</div>
						</div>	
					</div>
					<c:choose>
					    <c:when test = "${menudata.id == Null || menudata.id == ''}">
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
