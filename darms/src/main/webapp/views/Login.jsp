<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>DARMS | Login</title>
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
    <script src="js/popper.min.js"></script>
</head>
<style>
.error {
	color:red;
	font-size: 12px;
}
</style>
<body>
	<div style="display:none;">
		<h1>Heading1</h1><h2>Heading2</h2>
	</div>
	
	<!-- Accessibility -->
	<div class="container d-flex clearfix" id="b-accessibility">
		<div class="b-ministryname">
			<div class="text-right d-inline-block font-weight-bold b-acc-goi pr-sm-2">
				<span>उत्तर प्रदेश सरकार</span>
			</div>
			<div class="d-inline-block font-weight-bold b-acc-ministry pl-sm-2">
				<span>Government of Uttar Pradesh</span>
			</div>
		</div>
		
		
		<div class="ml-auto d-flex b-acc-icons">
			<div class="align-self-center">

				<div class="d-inline-block h-100 px-3">
					<img src="images/icons/ico-site-search.png" alt="site search icon" title="Site search" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;">

					<div class="dropdown-menu p-0 border-0 b-search">
						<label for="site-search" style="display:none;">Site search</label>
				        <input type="text" class="form-control float-left b-site-search" id="site-search" placeholder="Search" style="width: 150px; border-radius: 0;">
					    <div class="input-group-btn float-left">
					      <button class="btn" type="submit" style="border-radius: 0; background: #505050; color: white; box-shadow: 0 0 0 0.2rem rgba(0,123,255,0);"> 
					      	<span style="display:none;">Search</span>
					        <span class="fas fa-search"></span>
					      </button>
					    </div>
				    </div>
				</div>

				<div class="d-inline-block h-100 px-3 dropdown">
					<img src="images/icons/ico-social.png" alt="social sites links" title="Social links" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;">

					<div class="dropdown-menu b-social-dropdown" style="min-width: 50px; width: 50px">
				        <a href="javascript:void(0)" class="dropdown-item"> <span style="display:none;">Facebook link</span><span class="fab fa-facebook-f"></span> </a>
				        <a href="javascript:void(0);" class="dropdown-item"> <span style="display:none;">Twitter link</span><span class="fab fa-twitter"></span> </a>
				        <a href="javascript:void(0)" class="dropdown-item"> <span style="display:none;">Youtube link</span><span class="fab fa-youtube"></span> </a>
				    </div>
				</div>
				

				<div class="d-inline-block h-100 px-3">
					<a href="#b-homedb" class="align-self-center b-skiptomain" title="Skip to main content">
						<img src="images/icons/ico-skip.png" alt="skip to main content icon">
					</a>
				</div>

				<div class="d-inline-block h-100 px-3">
					<img src="images/icons/ico-accessibility.png" alt="accessibility icon" title="Accessibility Dropdown" class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;">

					<div class="dropdown-menu b-accessibility-dropdown" style="min-width: 50px; width: 50px">
				        <a href="javascript:void(0);" class="dropdown-item" title="Increase font size"> <span class="font-weight-bold"> A<sup>+</sup> </span> </a>
				        <a href="javascript:void(0)" class="dropdown-item" title="Reset font size"> <span class="font-weight-bold"> A </span> </a>
				        <a href="javascript:void(0);" class="dropdown-item" title="Decrease font size"> <span class="font-weight-bold"> A<sup>-</sup> </span> </a>
				        <a href="javascript:void(0)" class="dropdown-item bg-dark" title="High contrast"> <span class="font-weight-bold text-white"> A </span> </a>
				    </div>
				</div>

				<div class="d-inline-block h-100 px-3">
					<a href="site-map.html" title="Sitemap">
						<img src="images/icons/ico-sitemap.png" alt="sitemap icon">
					</a>
				</div>

				
			</div>
			
		</div>
		
	</div>


	<!-- Header -->
	<div class="container clearfix" id="b-header">
		<div class="float-left d-flex h-100">
			<img src="images/bor_logo.png" class="align-self-center b-emblem-image" style="width:100px;" title="National Emblem of India" alt="emblem of india logo">
		</div>

		<div class="float-left d-flex h-100">
			<h2 class="align-self-center pl-3 b-appname"><span class="font-weight-bold">DARMS</span> <br><span class="b-appfullname"> (Modern Record Room)</span></h2>
		</div>
	</div>

	<style type="text/css">
		.bar1, .bar2, .bar3 {
		    width: 25px;
		    height: 3px;
		    background-color: #fff;
		    margin: 5px 0;
		    transition: 0.4s;
		}

		.change .bar1 {
		  -webkit-transform: rotate(-45deg) translate(-5px, 5px);
		  transform: rotate(-45deg) translate(-5px, 5px);
		}

		.change .bar2 {opacity: 0;}

		.change .bar3 {
		  -webkit-transform: rotate(45deg) translate(-5px, -7px);
		  transform: rotate(45deg) translate(-5px, -7px);
		}
	</style>


	<!-- Global Navigation -->
	<div class="globalnav-bg">
		<div class="container">
			<nav class="navbar navbar-expand-sm navbar-dark px-0">
				<div class="d-flex w-100 b-nav-mobile">
					<button class="navbar-toggler align-self-center b-btn-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" onclick="myFunction(this)">
						<span style="display:none;">Menu</span>
						<div>
						  <div class="bar1"></div>
						  <div class="bar2"></div>
						  <div class="bar3"></div>
						</div>
					</button>
					<!-- <button class="btn btn-outline-light align-self-center ml-auto b-btn-login" type="button" data-toggle="modal" data-target="#login-modal">
						Log In
					</button>  -->
					
				</div>
				
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav main-menu d-flex">
						<li class="nav-item d-block"> <a href="index.html" class="nav-link active">Home</a> </li>
						<li class="nav-item d-block"> <a href="inner.html" class="nav-link">Advisories</a></li>
						<li class="nav-item d-block"> <a href="contactus.html" class="nav-link">Contact Us</a></li>
						<li class="nav-item d-block ml-auto b-loginbut"> <a href="/login" class="nav-link">Log In</a></li>
						<!-- <li class="nav-item d-block ml-auto b-loginbut" data-toggle="modal" data-target="#login-modal">
							<a class="nav-link" href="javascript:void(0);">Log In</a>
						</li> -->
					</ul>
				</div>

			</nav>
		</div>
	</div>

	<script>
function myFunction(x) {
  x.classList.toggle("change");
}
</script>
	


	<!-- Background -->
	
	

	<div class="b-bg-image py-5" style="padding-bottom: 60px!important">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 d-flex" style="background-color:#000000; opacity:0.9;">
					<div class="align-self-center pr-5">
						<h1 class="text-right mt-5 b-left-head">DARMS <br> (Modern Record Room)</h1>
					</div>
				</div>


				<div class="col-lg-6 b-login-sec" style="background-color:#000000; opacity:0.9;">
					<div class="d-block px-5 pt-5 pb-4 border-bottom-0 b-login-w">
						<c:if test = "${msg != Null}">
					        <div class="alert alert-${msg}" role="alert">${message}</div>
					    </c:if>
						<h2 class="b-login-head">Log In</h2>
					</div>

					<div class="">
						<form:form action="/loginaction" autocomplete="off"  modelAttribute="userLogin" method="post" class="px-5 b-login-w">
							<div class="form-group">
								<select name="userTypeId" class="form-control" id="select1">
									<option value="0" ${userLogin.getUserTypeId() == 0 ? 'selected="selected"' : ''}>चयन करे  </option>
									<option value="2" ${userLogin.getUserTypeId() == 2 ? 'selected="selected"' : ''}>राजस्व परिषद  </option>
									<option value="3" ${userLogin.getUserTypeId() == 3 ? 'selected="selected"' : ''}>मण्डल  </option>
									<option value="4" ${userLogin.getUserTypeId() == 4 ? 'selected="selected"' : ''}>जनपद  </option>
									<option value="5" ${userLogin.getUserTypeId() == 5 ? 'selected="selected"' : ''}>तहसील   </option>
								</select>
								<form:errors path="userTypeId" cssClass="error" />
							</div>
							<div class="form-group" id="selectDiv2" style="display:${userLogin.getUserTypeId() > 0 && userLogin.getUserTypeId() < 4 ? '' : 'none'};">
								<select name="loginTypeId" class="form-control" id="select2">
									<option value="0">चयन करे</option>
									<c:forEach var="logintype" items="${logintypelist}">
							       		<option ${logintype.getCode() == userLogin.getLoginTypeId() ? 'selected="selected"' : ''} value="${logintype.getCode()}">${logintype.getName()}</option>   
							   		</c:forEach>
								</select>
								<form:errors path="loginTypeId" cssClass="error" />
							</div>
							<div class="form-group" id="selectDiv3" style="display:${userLogin.getUserTypeId() > 3 ? '' : 'none'};">
								<select name="districtCode" class="form-control" id="select3">
									<option value="">चयन करे</option>
									<c:forEach var="dist" items="${districtlist}">
							       		<option ${dist.getDistrictCodeCensus() == userLogin.getDistrictCode() ? 'selected="selected"' : ''} value="${dist.getDistrictCodeCensus()}">${dist.getDistrictNameHindi()} (${dist.getDistrictName()})</option>   
							   		</c:forEach>
								</select>
								<form:errors path="districtCode" cssClass="error" />
							</div>
							<div class="form-group" id="selectDiv4" style="display:${userLogin.getUserTypeId() == 5 ? '' : 'none'};">
								<select name="tehsilCode" class="form-control" id="select4">
									<option value="">चयन करे</option>
									<c:forEach var="tehsil" items="${tehsillist}">
							       		<option ${tehsil.getTehsilCodeCensus() == userLogin.getTehsilCode() ? 'selected="selected"' : ''} value="${tehsil.getTehsilCodeCensus()}">${tehsil.getTnameEng()} (${tehsil.getTname()})</option>   
							   		</c:forEach>
								</select>
								<form:errors path="tehsilCode" cssClass="error" />
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="login-email-1" placeholder="Enter user id" name="userId">
								<form:errors path="userId" cssClass="error" />
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="login-pwd-1" placeholder="Enter password" name="password">
								<form:errors path="password" cssClass="error" />
							</div>
							<!-- <div class="form-group custom-control custom-checkbox">
								<input class="custom-control-input" id="login-rem-1" type="checkbox" name="remember"> 
								<label class="custom-control-label text-white" for="login-rem-1">Remember me</label>
							</div> -->
							<!-- <p class="text-right b-notreg">Don't have an account? <a href="">Sign Up</a></p> -->
							<div class="text-center py-4">
								<button type="submit" class="btn btn-primary b-btn">Log In</button>
							</div>
							
						</form:form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!----------- Footer ------------>
	<div class="footer-bs">
	    <footer class="container">
	        <div class="row">
	        	<div class="row col-md-7 col-sm-12 footer-nav">
	            	<p class="col-md-12">Quick Links —</p>
	            	<div class="col-sm-6">
	                    <ul class="list">
	                        <li><a href="inner.html">Policies</a></li>
	                        <li><a href="contactus.html">Contact Us</a></li>
	                        <li><a href="inner.html">Guidelines</a></li>
	                    </ul>
	                </div>
	                <div class="col-sm-6">
	                    <ul class="list">
	                    	<li data-toggle="modal" data-target="#feedback-modal"><a href="javascript:void(0)">Feedback</a></li>
	                        <li><a href="inner.html">Help Centre</a></li>
	                        <li><a href="javascript:void(0);">About Us</a></li>
	                    </ul>
	                </div>
	            </div>
	        	<div class="col-md-3 col-sm-8 footer-social d-flex">
        			<div class="d-inline-block align-self-center">
	        			<p class="bg-light"><img src="images/NIC.png" alt="NIC logo"></p>
	        			<p class="bg-light mb-0"><img src="images/digital-india.png" alt="digital india logo"></p>
	        		</div>
	            </div>
	        	<div class="col-md-2 col-sm-4 footer-ns d-flex">
	        			<a class="backtotop align-self-center d-flex text-center text-decoration-none text-white" title="Back to top" href="#b-accessibility">
	        				<span style="display:none;">Back to top</span>
		            		<span style="font-size: 24px;" class="fas fa-angle-up align-self-center mx-auto"></span>
		            	</a>
	            </div>
	        </div>
	        <div class="text-center mt-5 b-footer-credit" style="color: #000!important">
	        	Designed, developed and hosted by <a class="font-weight-bold" href="https://www.nic.in/">National Informatics Centre, UP State Unit, Lucknow</a>
	        </div>
	    </footer>
	</div>

	<!-- Login Modal -->
	<div class="modal fade" id="login-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Log In</h2>
					<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="dashboard.html" autocomplete="off" method="POST">
						<div class="form-group">
							<label for="login-email">Email:</label>
							<input type="email" class="form-control" id="login-email" placeholder="Enter email" name="login-email">
						</div>
						<div class="form-group">
							<label for="login-pwd">Password:</label>
							<input type="password" class="form-control" id="login-pwd" placeholder="Enter password" name="login-pwd">
						</div>
						<div class="form-group form-check">
							<label class="form-check-label" for="login-rem">
								<input class="form-check-input" type="checkbox" id="login-rem" name="remember"> Remember me
							</label>
						</div>
						<p class="text-right b-notreg">Don't have an account? <a href="" data-toggle="modal" data-target="#signup-modal" data-dismiss="modal">Sign Up</a></p>
						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Log In</button>
						</div>
						
					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- Signup Modal -->
	<div class="modal fade" id="signup-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Sign Up</h2>
					<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" autocomplete="off">
						<div class="form-group">
							<label for="signup-name">Name:</label>
							<input type="text" class="form-control" id="signup-name" placeholder="Enter name" name="signup-name">
						</div>
						<div class="form-group">
							<label for="signup-email">Email:</label>
							<input type="email" class="form-control" id="signup-email" placeholder="Enter email" name="signup-email">
						</div>
						<div class="form-group">
							<label for="signup-mobile">Mobile no.:</label>
							<input type="number" class="form-control" id="signup-mobile" placeholder="Enter mobile no." name="signup-mobile">
						</div>
						<div class="form-group">
							<label for="signup-pwd">Password:</label>
							<input type="password" class="form-control" id="signup-pwd" placeholder="Enter password" name="signup-pwd">
						</div>

						<p class="text-right b-already-reg">Already Registered? <a href="" data-toggle="modal" data-target="#login-modal" data-dismiss="modal">Log In</a></p>
						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Sign Up</button>
						</div>
						
					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- Feedback Modal -->
	<div class="modal fade" id="feedback-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-center d-block p-5 border-bottom-0">
					<h2 class="modal-title">Feedback</h2>
					<button type="button" class="close position-absolute" style="right: 15px; top: 8px;" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" autocomplete="off">
						<div class="form-group">
							<label for="fdbk-name">Name:</label>
							<input type="text" class="form-control" id="fdbk-name" placeholder="Enter name" name="fdbk-name">
						</div>
						<div class="form-group">
							<label for="fdbk-email">Email:</label>
							<input type="email" class="form-control" id="fdbk-email" placeholder="Enter email" name="fdbk-email">
						</div>
						<div class="form-group">
							<label for="fdbk-subject">Subject:</label>
							<select class="form-control" id="fdbk-subject" name="fdbk-subject">
								<option>Application issue</option>
								<option>Design issue</option>
								<option>Any other</option>
							</select>
						</div>
						<div class="form-group">
							<label for="fdbk-comment">Comment:</label>
							<textarea class="form-control" id="fdbk-comment" placeholder="Enter feedback" name="fdbk-comment" rows="5" style="resize: none;"></textarea>
						</div>

						<div class="text-center py-4">
							<button type="submit" class="btn btn-primary b-btn">Submit</button>
						</div>
						
					</form>
				</div>


			</div>
		</div>
	</div>

<!-- <br><br><br><br><br><br><br><br><br> -->
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



	<!-- <div class="d-flex" id="wrapper"> -->

    <!-- Sidebar -->
    <!-- <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Start Bootstrap </div>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div> -->
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <!-- <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
        <h1 class="mt-4">Simple Sidebar</h1>
        <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID which will toggle the menu when clicked.</p>
      </div>
    </div> -->
    <!-- /#page-content-wrapper -->

  <!-- </div> -->
  <!-- /#wrapper -->



  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="js/jquery.slicknav.min.js"></script>


  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

 
  

  <script>
	  	$(document).ready(function() {
	  		$(".b-navdropdown-click").click(function() {
	  			if($(".b-navdropdown").hasClass("hide")) {
	  				$(".b-navdropdown").addClass("show");
	  				$(".b-navdropdown").removeClass("hide");
	  				// $(".b-icon-up").show();
	  				// $(".b-icon-down").hide();
	  			} 
	  			else if($(".b-navdropdown").hasClass("show")) {
	  				$(".b-navdropdown").addClass("hide");
	  				$(".b-navdropdown").removeClass("show");
	  				// $(".b-icon-down").show();
	  				// $(".b-icon-up").hide();
	  			}
			});
	  		
	  		$("#select1").change(function(){
	  		    var type = $(this).val();
	  		    if(type > 0) {
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
			  		            for(var i=0; i<data.length; i++) {
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
	  		    } else {
	  		    	$("#selectDiv3").hide();
  		          	$("#selectDiv4").hide();
  		          	$("#selectDiv2").hide();
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


    <script src="vendor/jquery-ui/jquery-ui.js"></script>
    
</body>
</html>