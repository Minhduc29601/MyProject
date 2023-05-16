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
                    
					<h1 class="mt-4">Add/Upadte Products</h1>
                    <p>
						<sf:form method="post" action="${base}/admin/product/management" modelAttribute="product" enctype="multipart/form-data">
							<div class="form-group mb-2">
								<label for="productId">Product Id</label>
								<sf:input path="id" id="productId" class="form-control"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="category">Category (required)</label>
								<sf:select path="categories.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />									
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="title">Title (required)</label>
								<sf:input path="title" autocomplete="off" type="text" class="form-control" id="title" placeholder="Title" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="price">Price (required)</label>
								<sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="priceSale">Price Sale (required)</label>
								<sf:input type="number" autocomplete="off" path="priceSale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="short_description">Description (required)</label>
								<sf:textarea autocomplete="off" path="shortDes" class="form-control" placeholder="Short Description" id="short_description" rows="3" required="required"></sf:textarea>
							</div>
							
							<div class="form-group mb-2">
								<label for="detail_description">Details (required)</label>
								<sf:textarea autocomplete="off" path="details" class="form-control summernote" id="detail_description" rows="3" required="required"></sf:textarea>								
							</div>
							
							<div class="form-group form-check mb-2">
								<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
								<label class="form-check-label" for="isHot">Is Hot Product?</label>
							</div>
	
							<!-- avatar -->
							<div class="form-group mb-2">
								<label for="fileProductAvatar">Avatar</label> 
								<input type="file" id="fileProductAvatar" name="productAvatar" class="form-control">
							</div>
							<div class="form-group">
								<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.avatar}">
							</div>
	
							<!-- pictures -->
							<div class="form-group mb-2">
								<label for="fileProductPictures">Picture(Multiple)</label> 
								<input type="file" id="fileProductPictures" name="productPictures" class="form-control" multiple="multiple">
							</div>
							<div class="form-group">
								<c:forEach items="${product.productImages }" var="productImage">
									<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
								</c:forEach>
							</div>
							
							<br/>
							<a href="/admin/product/list" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
							<button type="submit" class="btn btn-primary">Save Product</button>
						</sf:form>

					</p>                    
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		<!-- internal javascript -->
		<!-- <script type="text/javascript">
			$(document).ready(function() {
				$('#detail_description').summernote();
			});
		</script> -->
		
    </body>
</html>
