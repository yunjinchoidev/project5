<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 홈</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function(){
	$("#pjList").change(function(){
		var selectedval = $(this).val();
		console.log(selectedval);
		location.href="/project5/projectHome.do?projectkey="+selectedval;
	})
})

</script>
<style>
#moveBtn a{
	width: 135px;
	margin-right: 10px;
	font-size: 20px;
	font-weight: bold;
}
</style>


<body>
	<%@ include file="../common/header.jsp"%>
	
	
	
	<div id="main">
	
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
				
						<%@ include file="sort.jsp" %>
                                                
                                    
                                    
                                    
                                    
                                                
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>프로젝트 홈</h3>
						<h4 style="color:red">${project.name }</h4>
						<p class="text-subtitle text-muted">공지를 확인하십시오.
							</p>
					</div>
				
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">DataTable</li>
							</ol>
						</nav>
					</div>
						
				</div>
				
			
                                    
                                    
                                    
                                    
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header">프로젝트 공지사항</div>
					<div class="card-body">
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							
							
							
							<div class="dataTable-top">
								<div class="dataTable-dropdown" style="width:30%;">
									<select class="dataTable-selector form-select" ><option
											value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option></select><label>entries per page</label>
								</div>
								<div class="dataTable-search">
									<input class="dataTable-input" placeholder="Search..."
										type="text">
										<a href="/project5/projectHomeWriteForm.do" class="btn btn-danger" style="text-align: right">글쓰기</a>
								</div>
							</div>
							
							
							
							
							
							<div class="dataTable-container">
								<table class="table table-striped dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 12.0176%;"><a
												href="#" class="dataTable-sorter">Name</a></th>
											<th data-sortable="" style="width: 42.9989%;"><a
												href="#" class="dataTable-sorter">Email</a></th>
											<th data-sortable="" style="width: 18.0816%;"><a
												href="#" class="dataTable-sorter">Phone</a></th>
											<th data-sortable="" style="width: 16.3175%;"><a
												href="#" class="dataTable-sorter">City</a></th>
											<th data-sortable="" style="width: 10.8049%;"><a
												href="#" class="dataTable-sorter">Status</a></th>
										</tr>
									</thead>




									<tbody>
											<tr>
												<td>Offenburg</td>
												<td>Offenburg</td>
												<td>Offenburg</td>
												<td>Offenburg</td>
												<td><span class="badge bg-success">Active</span></td>
											</tr>
									</tbody>




								</table>
								
							</div>






							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 10 of 26 entries</div>
								<ul
									class="pagination pagination-primary float-end dataTable-pagination">
									<li class="page-item pager"><a href="#" class="page-link"
										data-page="1">‹</a></li>
									<li class="page-item active"><a href="#" class="page-link"
										data-page="1">1</a></li>
									<li class="page-item"><a href="#" class="page-link"
										data-page="2">2</a></li>
									<li class="page-item"><a href="#" class="page-link"
										data-page="3">3</a></li>
									<li class="page-item pager"><a href="#" class="page-link"
										data-page="2">›</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</div>
</body>
</html>