<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light dashboard-bgcolor border-bottom">
  <button class="btn b-db-color" id="menu-toggle">
  	<span style="display:none;">Menu</span>
  	<span class="fas fa-bars" style="font-size: 1.4rem"></span>
  </button>

  <button class="navbar-toggler b-dropmenubtn" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  	<span class="far fa-caret-square-down" style="font-size: 30px; color: #FFF"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle b-db-color" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu dropdown-menu-right text-center b-dropmenu-db" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Edit Profile</a>
	 <!-- <a class="dropdown-item" href="#">Another action</a> -->
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#signout-modal">Sign Out</a>
        </div>
      </li>
    </ul>
  </div>
</nav>

<div class="container-fluid">
	<div class="row" style="background: #777; color:#fff;">
		<div class="col-6 col-sm-6 col-md-3 p-3">Name: <c:out value="${sessionScope.userName}"/></div>
		<div class="col-6 col-sm-6 col-md-3 p-3">Role: <c:out value="${sessionScope.roleName}"/></div>
		<c:if test="${sessionScope.userType != '' && sessionScope.userType != null}">
		<div class="col-6 col-sm-6 col-md-3 p-3">User Of: <c:out value="${sessionScope.userType}"/></div>
		</c:if>
		<c:if test="${sessionScope.loginType != '' && sessionScope.loginType != null}">
		<div class="col-6 col-sm-6 col-md-3 p-3">Section/Division: <c:out value="${sessionScope.loginType}"/></div>
		</c:if>
		<c:if test="${sessionScope.districtName != '' && sessionScope.districtName != null}">
		<div class="col-6 col-sm-6 col-md-3 p-3">District: <c:out value="${sessionScope.districtName} (${sessionScope.districtNameHindi})"/></div>
		</c:if>
		<c:if test="${sessionScope.tnameEng != '' && sessionScope.tnameEng != null}">
		<div class="col-6 col-sm-6 col-md-3 p-3">Tehsil: <c:out value="${sessionScope.tnameEng} (${sessionScope.tname})"/></div>
		</c:if>
	</div>
</div>