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
          <li>Access Permission</li>
      </ul>
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6">
	        	<h3 style="font-size:32px;">Access Permission</h3>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-sm-4">
        		<c:if test = "${msg != Null}">
			        <div class="alert alert-${msg}" role="alert">${message}</div>
			    </c:if>
        		<form:form action="/submit_access_permission" modelAttribute="accessPermission" method="post" class="w-sm-50 w-auto mx-auto">
                	<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							<label>Role</label>
		                	<select name="roleId" class="form-control" onchange="getaccesspermission(this.value)">
								<option value="0">चयन करे</option>
								<c:forEach var="role" items="${rolelist}">
						       		<option ${userEntry.getRoleId() == role.getRole_id()? 'selected' : (userdata.roleId == role.getRole_id()? 'selected' : '')} value="${role.getRole_id()}">${role.getName()}</option>   
						   		</c:forEach>
							</select>
							<form:errors path="roleId" cssClass="error" />
							</div>
						</div>
					</div>
                	
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							<label>Choose Menu</label>
							<div class="panel-group" id="accordion">
									<c:forEach var="menu" items="${menudata}">
									<ul class="panel panel-default" style="list-style-type:none;">
										<c:if test="${menu.parentId == 0 }">
										<li data-parent="#accordion" href="#collapse${menu.id}">
										  <div class="panel-heading">
											<h5 class="panel-title">
											<span>
												<input type="checkbox" class="${menu.id}" onclick="selectAll('${menu.id}');" value="${menu.id}" name="menuId">
										  	</span>
										  	${menu.nameEng}
											</h5>
										  </div>
										</li>
										</c:if>
										
										<c:if test="${menu.parentId > 0 }">
										<div id="collapse${menu.parentId}" class="panel-collapse">
											<li>
												&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="ab${menu.parentId}" 
												value="${menu.id}" name="menuId"> ${menu.nameEng}
											</li>
										</div>
										</c:if>
									</ul>
									</c:forEach>
								</div>
								
							</div>	
						</div>
					</div>
					<div class="row">
		                <div class="col-md-12">
		                    <button type="submit" class="btn btn-primary b-btn">Submit</button>
		                </div>
		            </div>

				</form:form>
        	</div>
        </div>        
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <jsp:include page="Footer.jsp"></jsp:include>
  
  <script type="text/javascript">
  /* function selectAll(a) {
		if($('.' + a).is(":checked")) { 
			alert("checked");
			$('.' + a).prop( 'checked', false );
		} else {
			$('.' + a).prop( 'checked', true );
		}
	} */
	
	function selectAll(a) {
		var len = $('input:checkbox.' + a + ':checked').length;
		if(len > 0 && $('.' + a).is(":checked")) {
			$('.ab' + a).prop( 'checked', true );
		} else {
			$('.ab' + a).prop( 'checked', false );
		}
	}
  
  function getaccesspermission(role) {
		$.ajax({
			url: "/rolewise_access_permission/?roleId=" + role,
			type: "GET",
			success: function(data) {
				$("#accordion").html(data);
			}
		})
	}
  </script>
  
</body>
</html>
