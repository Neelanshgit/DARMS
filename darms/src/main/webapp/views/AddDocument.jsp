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
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		    /* display: none; <- Crashes Chrome on hover */
		    -webkit-appearance: none;
		    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
		}
		
		input[type=number] {
		    -moz-appearance:textfield; /* Firefox */
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
          <li>Add Document</li>
      </ul>
      
      <div class="container-fluid">
        <div class="row">
	      	<div class="col-md-6 col-sm-6 col-xs-6">
      		<c:choose>
			    <c:when test = "${documentdata.id == Null}">
			        <h3 style="font-size:32px;">Add Document</h3>
			    </c:when>    
			    <c:otherwise>
			        <h3 style="font-size:32px;">Update Document</h3>
			    </c:otherwise>
			</c:choose>
	       	</div>
	    </div>

        <div class="row">
        	<div class="col-md-10 p-4">
                <form:form action="/submit_document" modelAttribute="documentEntry" method="post" class="w-sm-50 w-auto mx-auto" enctype="multipart/form-data">
					<h4>Document Detail</h4>
					<div class="row">
						<div class="col-md-6">
		                	<div class="form-group">
								<label for="document_type">Document Type:</label>
								<c:choose>
								    <c:when test = "${documentdata.id == Null}">
								        <input type="hidden" name="id" value="0">
								    </c:when>    
								    <c:otherwise>
								        <input type="hidden" name="id" value="${documentdata.id}">
								    </c:otherwise>
								</c:choose>
								<select class="form-control" name="document_type">
									<option value="">--Select--</option>
									<c:forEach var="doctype" items="${documenttypedata}">
							       		<option value="${doctype.getCode()}" ${documentEntry.getDocument_type()==doctype.getCode()? 'selected' : (documentdata.documentType==doctype.getCode()? 'selected' : '')}>${doctype.getName()}</option>   
							   		</c:forEach>
								</select>
								<form:errors path="document_type" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="start_page">Start Page:</label>
								<input type="number" class="form-control noscroll" name="start_page" placeholder="Start Page" value="${documentEntry.getStart_page()!=Null? documentEntry.getStart_page() : (documentdata.startPage!=Null? documentdata.startPage : '')}">
								<form:errors path="start_page" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="start_page">End Page:</label>
								<input type="number" class="form-control noscroll" name="end_page" placeholder="End Page" value="${documentEntry.getEnd_page()!=Null? documentEntry.getEnd_page() : (documentdata.endPage!=Null? documentdata.endPage : '')}">
								<form:errors path="end_page" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="total_pages">No. of Pages:</label>
								<input type="number" class="form-control readonly noscroll" name="total_pages" placeholder="Enter no. of pages" value="${documentEntry.getTotal_pages()!=Null? documentEntry.getTotal_pages() : (documentdata.totalPages!=Null? documentdata.totalPages : '')}">
								<form:errors path="total_pages" cssClass="error" />
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="village_code">Select Village:</label>
								<select class="form-control" name="village_code">
									<option value="">--Select--</option>
									<c:forEach var="vlg" items="${villagedata}">
							       		<option ${vlg.getVillageCodeCensus() == documentEntry.getVillage_code() ? 'selected' : (documentdata.villageCode==vlg.getVillageCodeCensus()? 'selected' : '')} value="${vlg.getVillageCodeCensus()}">${vlg.getVnameEng()} (${vlg.getVname()})</option>   
							   		</c:forEach>
								</select>
								<form:errors path="village_code" cssClass="error" />
							</div>
						</div>
					</div>
					
					<h4>Land Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="fasli_year">Fasli Year:</label>
								<select class="form-control" name="fasli_year">
									<option value="">--Select--</option>
									<option value="1974-1980" ${documentEntry.getFasli_year()=="1974-1980"? "selected" : (documentdata.fasliYear=="1974-1980"? "selected" : '')}>1974-1980</option>
									<option value="1974-2000" ${documentEntry.getFasli_year()=="1974-2000"? "selected" : (documentdata.fasliYear=="1974-2000"? "selected" : '')}>1974-2000</option>
								</select>
								<form:errors path="fasli_year" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="khasra_no">Khasra Number:</label>
								<input type="text" class="form-control" name="khasra_number" value="${documentEntry.getKhasra_number()!=Null? documentEntry.getKhasra_number() : (documentdata.khasraNumber!=Null? documentdata.khasraNumber : '')}" placeholder="Enter khasra number">
								<form:errors path="khasra_number" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="owner_name">Owner Name:</label>
								<input type="text" class="form-control" name="owner_name" value="${documentEntry.getOwner_name()!=Null? documentEntry.getOwner_name() : (documentdata.ownerName!=Null? documentdata.ownerName : '')}" placeholder="Enter owner name">
								<form:errors path="owner_name" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="father_name">Father's/Guardian Name:</label>
								<input type="text" class="form-control" name="father_name" value="${documentEntry.getFather_name()!=Null? documentEntry.getFather_name() : (documentdata.fatherName!=Null? documentdata.fatherName : '')}" placeholder="Enter father's/guardian name">
								<form:errors path="father_name" cssClass="error" />
							</div>
						</div>
					</div>
					
					<h4>Storage Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="compactor_no">Compactor No.:</label>
								<select class="form-control" name="compactor_no">
									<option value="0">--Select--</option>
									<c:forEach var = "c" begin = "1" end = "${storagedata.getTotal_compactors()}">
								     	<option value="${c}" ${documentEntry.getCompactor_no()==c? "selected" : (documentdata.compactorNo==c? 'selected' : '')}>Compactor ${c}</option>
								  	</c:forEach>
								</select>
								<form:errors path="compactor_no" cssClass="error" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="rack_no">Rack No.:</label>
								<select class="form-control" name="rack_no">
									<option value="0">--Select--</option>
									<c:forEach var = "r" begin = "1" end = "${storagedata.getTotal_racks()}">
								     	<option value="${r}" ${documentEntry.getRack_no()==r? "selected" : (documentdata.rackNo==r? 'selected' : '')}>Rack ${r}</option>
								  	</c:forEach>
								</select>
								<form:errors path="rack_no" cssClass="error" />
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label for="bundle_no">Bundle No.:</label>
								<select class="form-control" name="bundle_no">
									<option value="0">--Select--</option>
									<c:forEach var = "b" begin = "1" end = "${storagedata.getTotal_bundles()}">
								     	<option value="${b}" ${documentEntry.getBundle_no()==b? "selected" : (documentdata.bundleNo==b? 'selected' : '')}>Bundle ${b}</option>
								  	</c:forEach>
								</select>
								<form:errors path="bundle_no" cssClass="error" />
							</div>
						</div>
					</div>
					
					<h4>File Detail</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="upload">File upload:</label>
								<input type="file" name="upload" class="form-control border">
								<form:errors path="upload" cssClass="error" />
								<c:if test = "${documentdata.fileName!=Null}">
									<a href="/files/${documentdata.fileName}" target="_blank">View Existing Document</a>
								</c:if>
							</div>
						</div>
						
					</div>
					
					<div class="form-group">
						<label for="description">Description:</label>
						<textarea class="form-control" rows="3" name="description" style="resize: none;" placeholder="Enter your comment">${documentEntry.getDescription()!=Null? documentEntry.getDescription() : (documentdata.description!=Null? documentdata.description : '')}</textarea>
					</div>
					
					<c:choose>
					    <c:when test = "${documentdata.id == Null}">
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
 
 <script>
 document.addEventListener("wheel", function(event){
	if(document.activeElement.type === "number" &&
	   document.activeElement.classList.contains("noscroll"))
	{
	    document.activeElement.blur();
	}
 });
 
 $(".readonly").keydown(function(e){
     e.preventDefault();
 });
 
 $("select[name=village_code]").change(function(){
	var village_code = $(this).val();
	var khasra_number = $("input[name=khasra_number]").val();
	if(khasra_number && village_code) {
		getPlotDetail(village_code, khasra_number);
	}
 });
 
 $("input[name=khasra_number]").change(function(){
	var khasra_number = $(this).val();
	var village_code = $("select[name=village_code]").val();
	if(khasra_number && village_code) {
		getPlotDetail(village_code, khasra_number);
	}
 });
 
 function getPlotDetail(village_code, khasra_number) {
	 $.ajax({
	    type: 'GET',
	    url: "https://upbhulekh.gov.in/WS_Vaad/service?village="+village_code+"&gata="+khasra_number+"&type=json&get=plot_detail&api_key=apikey",
	    dataType: 'json',
		success: function(data){
	    	var json = JSON.parse(JSON.stringify(data));
	        if(json.RESPONSE == true) {
	        	var plotinfo = json.DATA.plot_detail;
	        	for(var i=0; i<1; i++){
	        		$("input[name=owner_name]").val(plotinfo[i].name);
	            }
	        }
	    },
	    error:function(){
	        alert("error");
	    }
	 });
 }
 
 $("input[name=start_page]").bind('keyup mouseup wheel', function () {
	 var start = $("input[name=start_page]").val();
	 var end = $("input[name=end_page]").val();
	 var total = 0;
	 if(start && end) {
		 if(parseInt(start)<=parseInt(end)) {
			 total = (parseInt(end) - parseInt(start)) + 1;
		 }
	 }
	 $("input[name=total_pages]").val(total);
 });
 
 $("input[name=end_page]").bind('keyup mouseup wheel', function () {
	 var start = $("input[name=start_page]").val();
	 var end = $("input[name=end_page]").val();
	 var total = 0;
	 if(start && end) {
		 if(parseInt(start)<=parseInt(end)) {
			 total = (parseInt(end) - parseInt(start)) + 1;
		 }
	 }
	 $("input[name=total_pages]").val(total);
 });
 	
 </script>
	
</body>
</html>
