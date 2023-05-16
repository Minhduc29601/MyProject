<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
        
    </head>
    <body>
        <div class="d-flex" id="wrapper">
        
            <!-- Sidebar-->
            <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                <!-- Top navigation-->
            	<jsp:include page="/WEB-INF/views/administrator/layout/menu.jsp"></jsp:include>    
                
                <!-- Page content-->
                <div class="container-fluid">
                    
                    <form action="${base }/admin/product/list" method="get">
						
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
												
								<input id="page" name="page" class="form-control" value="${productSerach.currentPage }">
																
								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" autocomplete="off" style="margin-right: 5px;" 
									   value="${productSerach.keyword }">
								
								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="categoryId" id="categoryId" style="margin-right: 5px;">
									<option value="0">All</option>
									<c:forEach items="${categories}" var="category">
										<option value="${category.id }">${category.name }</option>
									</c:forEach>
								</select>
								
								<button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-primary">Seach</button>
							</div>
							<div>
								<a class="btn btn-outline-primary mb-1" href="${base }/admin/product/management/" role="button">
									Add New
								</a>
							</div>
						</div>
						
						<!-- danh sách sản phẩm -->
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Title</th>
									<th scope="col">Price</th>
									<th scope="col">Category</th>
									<th scope="col">Xóa/Chưa Xóa</th>
									<th scope="col">Avatar</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${products.data}" var="product" varStatus="loop">
									<tr>
										<th scope="row" width="5%">
											${loop.index + 1}
										</th>
										<td>
											${product.title }
										</td>
										<td>
											<!-- định dạng tiền tệ -->
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${product.price }" type="currency" />
										</td>
										<td>
											${product.categories.name }
										</td>
										<td>
											<span id="_product_status_${product.id} }">
												<c:choose>
													<c:when test="${product.status }">
														<input type="checkbox" checked="checked" readonly="readonly">
													</c:when>
													<c:otherwise>
														<input type="checkbox" readonly="readonly">
													</c:otherwise>
												</c:choose>
											</span>
										</td>
										<td>
											<img src="${base }/upload/${product.avatar}" width="100" height="100">
										</td>
										<td width="15%">
											<div>
												<a class="btn btn-primary" href="${base }/admin/product/management/${product.id}" role="button">Edit</a>
												<a class="btn btn-danger" role="button" onclick="DeleteProduct(${product.id});">Delete</a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!-- phân trang -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
						
					</form>
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		<script type="text/javascript">
			$( document ).ready(function() {
				
				// đặt giá trị của category ứng với điều kiện search trước đó
				$("#categoryId").val(${productSerach.categoryId});
				
				$(function() {
				    $("#paging").pagination({
				    	currentPage: ${products.currentPage}, 	//trang hiện tại
				        items: ${products.totalItems},			//tổng số sản phẩm
				        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
				        cssStyle: 'light-theme',
				        onPageClick: function(pageNumber, event) {
				        	$('#page').val(pageNumber);
				        	$('#btnSearch').trigger('click');
						},
				    });
				});
			});			
		</script>
		
    </body>
</html>
