<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="dataSource" url="jdbc:postgresql://localhost:5432/darms" user="postgres" password="postgres"/>
<!-- Sidebar -->
    <div class="dashboard-bgcolor border-right" id="sidebar-wrapper">
      <div class="sidebar-heading text-center b-db-color" style="font-size: 24px">
      	  <span class="fas fa-tachometer-alt"></span> &nbsp;<span class="text-uppercase">DARMS</span> 
      </div>
      <style>
      	.b-leftmenu ul li.active a {
			background: #f8f8f8 !important;
			color: #515151 !important;
		}
		.b-leftmenu li.sub-menu ul li.active a.b-newpage {
			background: #ebebeb !important;
			border-left: 4px solid #3498db !important;
		}
      </style>
      <div class="list-group list-group-flush b-leftmenu">
        <ul id="sortable-menu">
			<li class="${requestUri == '/dashboard'? 'active' : ''}"><a href='/dashboard' class="dashboard-bgcolor b-db-color border-bottom b-newpage">Dashboard</a></li>
			<!-- <li class='sub-menu'><a href='javascript:void(0)' class="dashboard-bgcolor border-bottom b-db-color b-newpage">Charts<div class='fa fa-caret-down right'></div></a>
				<ul>
					<li><a class="b-newpage" href='barchart.html'>Bar Charts</a></li>
					<li><a class="b-newpage" href='linechart.html'>Line Charts</a></li>
					<li><a class="b-newpage" href='areachart.html'>Area Charts</a></li>
					<li class='sub-sub-menu'><a href='javascript:void(0)' class="b-newpage">Other Charts <div class='fa fa-caret-down right'></div></a>
						<ul>
							<li><a class="b-newpage" href='scatterchart.html'>Scatter Chart</a></li>
							<li><a class="b-newpage" href='doughnut-piechart.html'>Doughnut &amp; Pie Charts</a></li>
							<li><a class="b-newpage" href='polarareachart.html'>Polar Area Chart</a></li>
						</ul>
					</li>
				</ul>
			</li> -->
			<c:forEach var="menuaccess" items="${sessionScope.menuAccess}">
				<c:if test="${!menuaccess.getMapped_url().isEmpty() }">
					<li class="${requestUri == menuaccess.getMapped_url()? 'active' : ''}"><a href='${menuaccess.getMapped_url()}' class="dashboard-bgcolor border-bottom b-newpage b-db-color">${menuaccess.getName_eng()}
					</a></li>
				</c:if>
				
				<c:if test="${menuaccess.getMapped_url().isEmpty()}">
					<sql:query dataSource="${dataSource}" var="result">
					    select m.* from menus m where m.parent_id = '${menuaccess.getId()}' order by name_eng ASC;
					</sql:query>
				<li class='sub-menu'><a href='javascript:void(0)' class="dashboard-bgcolor border-bottom b-db-color b-newpage">${menuaccess.getName_eng()}<div class='fa fa-caret-down right'></div></a>
					<ul style="display:block;">
						<c:forEach var="row" items="${result.rows}">
						<li class="${requestUri == row.mapped_url? 'active' : ''}"><a href='${row.mapped_url}' class="b-newpage">${row.name_eng}</a></li>
						</c:forEach>
					</ul>
				</li>
				</c:if>
			</c:forEach>
			<!-- 
			<li class='sub-menu'><a href='javascript:void(0)' class="dashboard-bgcolor border-bottom b-db-color b-newpage">Documents<div class='fa fa-caret-down right'></div></a>
				<ul>
					<li><a href='/add_document' class="b-newpage">Add Document</a></li>
					<li><a href='/view_document' class="b-newpage">View/Edit Document</a></li>
				</ul>
			</li> 
			
			<li class='sub-menu'><a href='javascript:void(0)' class="dashboard-bgcolor border-bottom b-db-color b-newpage">Multi-level Dropdown<div class='fa fa-caret-down right'></div></a>
				<ul>
					<li><a href='javascript:void(0);' class="b-newpage">Second Level Item</a></li>
					<li><a href='javascript:void(0)' class="b-newpage">Second Level Item</a></li>
					<li class='sub-sub-menu'><a href='javascript:void(0);' class="b-newpage">Third Level <div class='fa fa-caret-down right'></div></a>
						<ul>
							<li><a href='javascript:void(0)' class="b-newpage">Third Level Item</a></li>
							<li><a href='javascript:void(0);' class="b-newpage">Third Level Item</a></li>
							<li><a href='javascript:void(0)' class="b-newpage">Third Level Item</a></li>
						</ul>
					</li>
				</ul>
			</li> -->
		</ul>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->