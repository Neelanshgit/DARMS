<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:forEach var="menu" items="${menudata}">
<ul class="panel panel-default" style="list-style-type:none;">
	<c:if test="${menu.parentId == 0 }">
	<li data-parent="#accordion" href="#collapse${menu.id}">
	  <div class="panel-heading">
		<h5 class="panel-title">
		<label>
			<input type="checkbox" class="${menu.id}" onclick="selectAll('${menu.id}');" value="${menu.id}"
			 name="menuId" <c:if test="${menuList.contains(Integer.parseInt(menu.id.toString()))}">checked</c:if>>
			 ${menu.nameEng}
	  	</label>
		</h5>
	  </div>
	</li>
	</c:if>
	
	<c:if test="${menu.parentId > 0 }">
	<div id="collapse${menu.parentId}" class="panel-collapse">
		<li>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="ab${menu.parentId}" 
			value="${menu.id}" name="menuId" <c:if test="${menuList.contains(Integer.parseInt(menu.id.toString()))}">checked</c:if>> 
			${menu.nameEng}</label>
		</li>
	</div>
	</c:if>
</ul>
</c:forEach>