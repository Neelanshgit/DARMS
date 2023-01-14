<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en ">
<head>
	<title>DARMS | Add User</title>
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
	
	<div class="d-flex" id="wrapper">

    <jsp:include page="SideBar.jsp"></jsp:include>

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <jsp:include page="Header.jsp"></jsp:include>

      <!-- Breadcrumb -->
      <ul class="breadcrumb">
          <li><a href="/dashboard">Dashboard</a></li>
		<c:choose>
		    <c:when test = "${userdata.id == Null || userdata.id == ''}">
		        <li>Add User</li>
		    </c:when>    
		    <c:otherwise>
		        <li>Edit User</li>
		    </c:otherwise>
		</c:choose>
          
      </ul>
      
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6 col-sm-6 col-xs-6">
	      		<c:choose>
				    <c:when test = "${userdata.id == Null || userdata.id == ''}">
				        <h3 style="font-size:32px;">Add User</h3>
				    </c:when>    
				    <c:otherwise>
				        <h3 style="font-size:32px;">Edit User</h3>
				    </c:otherwise>
				</c:choose>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-4">
        		<form:form action="/submit_user" modelAttribute="userEntry" method="post">
                	<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label for="name">Name:</label>
								<c:choose>
								    <c:when test = "${userdata.id == Null || userdata.id == ''}">
								        <input type="hidden" name="id" value="0">
								    </c:when>    
								    <c:otherwise>
								        <input type="hidden" name="id" value="${userdata.id}">
								    </c:otherwise>
								</c:choose>
								<input type="text" class="form-control" name="name" placeholder="Enter name" value="${userEntry.getName()!=Null? userEntry.getName() : (userdata.name!=Null? userdata.name : '')}">
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
							<label for="mobile">Mobile No.:</label>
							<input type="text" class="form-control" name="mobile" placeholder="Enter mobile no." value="${userEntry.getMobile()!=Null? userEntry.getMobile() : (userdata.mobile!=Null? userdata.mobile : '')}">
							<form:errors path="mobile" cssClass="error" />
						</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
		                		<label for="userTypeId">User Type:</label>
								<select name="userTypeId" class="form-control" id="select1">
									<option value="0" ${userEntry.getUserTypeId()=="0"? 'selected' : (userdata.userTypeId == "0"? 'selected' : '')}>चयन करे  </option>
									<option value="2" ${userEntry.getUserTypeId()=="2"? 'selected' : (userdata.userTypeId == "2"? 'selected' : '')}>राजस्व परिषद  </option>
									<option value="3" ${userEntry.getUserTypeId()=="3"? 'selected' : (userdata.userTypeId == "3"? 'selected' : '')}>मण्डल  </option>
									<option value="4" ${userEntry.getUserTypeId()=="4"? 'selected' : (userdata.userTypeId == "4"? 'selected' : '')}>जनपद  </option>
									<option value="5" ${userEntry.getUserTypeId()=="5"? 'selected' : (userdata.userTypeId == "5"? 'selected' : '')}>तहसील  </option>
								</select>
								<form:errors path="userTypeId" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6" id="selectDiv2" style="display:${userEntry.getUserTypeId() > 0 && userEntry.getUserTypeId() < 4 ? '' : (userdata.userTypeId > 0 && userdata.userTypeId < 4 ? '' : 'none')};">
							<div class="form-group">
								<label for="loginTypeId">चयन करे:</label>
								<select name="loginTypeId" class="form-control" id="select2">
									<option value="0">चयन करे</option>
									<c:forEach var="logintype" items="${logintypelist}">
							       		<option ${userEntry.getLoginTypeId() == logintype.getCode()? 'selected' : (userdata.loginTypeId == logintype.getCode()? 'selected' : '')} value="${logintype.getCode()}">${logintype.getName()}</option>   
							   		</c:forEach>
								</select>
								<form:errors path="loginTypeId" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6" id="selectDiv3" style="display:${userEntry.getUserTypeId() > 3? '' : (userdata.districtCode!=Null? '' : 'none')};">
							<div class="form-group">
								<label for="districtCode">जनपद:</label>
								<select name="districtCode" class="form-control" id="select3">
									<option value="">चयन करे</option>
									<c:forEach var="dist" items="${districtlist}">
							       		<option ${userEntry.getDistrictCode() == dist.getDistrictCodeCensus()? 'selected' : (userdata.districtCode == dist.getDistrictCodeCensus()? 'selected' : '')}  value="${dist.getDistrictCodeCensus()}">${dist.getDistrictName()} (${dist.getDistrictNameHindi()})</option>   
							   		</c:forEach>
								</select>
								<form:errors path="districtCode" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6" id="selectDiv4" style="display:${userEntry.getUserTypeId() == 5 ? '' : (userdata.tehsilCode!=Null? '' : 'none')};">
							<div class="form-group">
								<label for="tehsilCode">तहसील:</label>
								<select name="tehsilCode" class="form-control" id="select4">
									<option value="">चयन करे</option>
									<c:forEach var="tehsil" items="${tehsillist}">
							       		<option ${userEntry.getTehsilCode() == tehsil.getTehsilCodeCensus()? 'selected' : (userdata.tehsilCode == tehsil.getTehsilCodeCensus()? 'selected' : '')} value="${tehsil.getTehsilCodeCensus()}">${tehsil.getTnameEng()} (${tehsil.getTname()})</option>   
							   		</c:forEach>
								</select>
								<form:errors path="tehsilCode" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="userId">User Id:</label>
								<input type="text" class="form-control" id="login-email-1" placeholder="Enter user id" name="userId" value="${userEntry.getUserId()!=Null? userEntry.getUserId() : (userdata.userId!=Null? userdata.userId: '')}" <c:if test="${userdata.userId != '' && userdata.userId != null}">readonly</c:if> >
								<form:errors path="userId" cssClass="error"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="password">Password:</label>
								<input type="password" class="form-control" id="login-pwd-1" placeholder="Enter password" name="password">
								<form:errors path="password" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="roleId">User Role:</label>
								<select class="form-control" name="roleId">
									<option value="0">----</option>
									<c:forEach var="role" items="${rolelist}">
							       		<option ${userEntry.getRoleId() == role.getRole_id()? 'selected' : (userdata.roleId == role.getRole_id()? 'selected' : '')} value="${role.getRole_id()}">${role.getName()}</option>   
							   		</c:forEach>
								</select>
								<form:errors path="roleId" cssClass="error" />
							</div>
						</div>
					</div>
					<c:choose>
					    <c:when test = "${userdata.id == Null || userdata.id == ''}">
					        <button type="submit" class="btn btn-primary b-btn">Create User</button>
					    </c:when>    
					    <c:otherwise>
					        <button type="submit" class="btn btn-primary b-btn">Update User</button>
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
 
 <script>
 $(document).ready(function() {
	 $("#select1").change(function(){
	    var type = $(this).val();
	    if(type == "2" || type == "3")
	   	{
	    	if(type == "2") { var listtype = "B"; } else { var listtype = "C"; }
	    	$.ajax({
		        type: "GET",
		        url: "/get_login_type_list/?type=" + listtype,
		        success: function(data) {
		            var selectlist2 = $('#select2'), option="";
		          	selectlist2.empty();
		            option = '<option value="0">चयन करे</option>';
		            $('#select3').html('<option value="">चयन करे</option>');
  		          	$('#select4').html('<option value="">चयन करे</option>');
		            for(var i=0; i<data.length; i++){
		                option = option + "<option value='"+data[i].code + "'>"+ data[i].name + "</option>";
		            }
		          	selectlist2.append(option);
		          	$("#selectDiv3").hide();
		          	$("#selectDiv4").hide();
		          	$("#selectDiv2").show();
		        },
		        error:function(){
		            alert("error");
		        }
		    });
	   	} else {
		    $.ajax({
		        type: 'GET',
		        url: "/get_districts",
		        success: function(data){
		            var selectlist3 = $('#select3'), option="";
		          	selectlist3.empty();
		            option = '<option value="">चयन करे</option>';
		            for(var i=0; i<data.length; i++){
		                option = option + "<option value='"+data[i].districtCodeCensus + "'>"+ data[i].districtName + " ("+ data[i].districtNameHindi +")</option>";
		            }
		          	selectlist3.append(option);
			      	$("#selectDiv3").show();
		          	$("#selectDiv4").hide();
		          	$("#selectDiv2").hide();
		        },
		        error:function(){
		            alert("error");
		        }
		    });
	   	}
	});

	$("#select3").change(function(){
	    var type = $("#select1").val();
	    var districtcode = $(this).val();
	    $.ajax({
	        type: 'GET',
	        url: "/get_tehsils/?distCode=" + districtcode,
	        success: function(data){
	            var selectlist4 = $('#select4'), option="";
	          	selectlist4.empty();
	            option = '<option value="">चयन करे</option>';
	            for(var i=0; i<data.length; i++){
	                option = option + "<option value='"+data[i].tehsilCodeCensus + "'>"+ data[i].tnameEng + " ("+ data[i].tname +")</option>";
	            }
	          	selectlist4.append(option);
	          	if(type == "5") {
	          		$("#selectDiv4").show();
	          	} else {
	          		$("#selectDiv4").hide();
	          	}
	        },
	        error:function(){
	            alert("error");
	        }
	    });
	});
 });
</script>
	
</body>
</html>
