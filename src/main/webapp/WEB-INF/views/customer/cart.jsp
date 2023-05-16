<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/customer/layout/menu.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			
			<!-- Danh sách sản phẩm trong giỏ hàng -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Product</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Price</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Quantity</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Remove</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<!-- hiển thị danh sách sản phẩm trong giỏ hàng -->
						<!-- cart: là data trên session -->
						<!-- dữ liệu trên session sẽ đọc được ở bất page jsp nào -->
						<c:forEach items="${cart.cartItems }" var="ci" >
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img src="${base }/upload/${ci.image}" width="100" height="100">
										<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>
											<span class="text-muted font-weight-normal font-italic d-block">Category: ${product.ci.productId.categories.name}</span>
										</div>
									</div>
								</th>
								<td class="border-0 align-middle">
									<fmt:setLocale value="vi_VN" scope="session"/>
									<strong><fmt:formatNumber value="${ci.priceUnit }" type="currency"/></strong>
								</td>
								<td class="border-0 align-middle">
									<button class="btn btn-danger" onclick="UpdateQualityCart('${base }', ${ci.productId}, -1)" value="-"> - </button>
									<strong><span id="quality_${ci.productId}">${ci.quality }</span></strong>
									<button class="btn btn-success" onclick="UpdateQualityCart('${base }', ${ci.productId}, 1)" value="+"> + </button>
								</td>
								<td class="border-0 align-middle">
									<button onclick="DeleteToCart('${base }', ${ci.productId})" class="btn btn-outline-danger">Xóa</button>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>

			<!-- form cho việc thanh toán -->
			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<div class="bg-danger rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
						<div class="p-4">
						
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Họ và tên khách hàng</label>
								<input type="text" class="form-control" id="customerFullName" name="customerFullName" value="${userLogined.username }" placeholder="Full name">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerEmail">Địa chỉ Email</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Phone</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone }" placeholder="Phone">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerAddress">Địa chỉ giao hàng</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${userLogined.shippingAddress }" placeholder="Address">
							</div>
							
							
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-danger rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin thanh toán</div>
						<div class="p-4">
							<p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong>${totalPrice }</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and handling</strong><strong>0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong>0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong> <h5 class="font-weight-bold totalPrice">${totalPrice }</h5></li>
							</ul>
							<button type="submit" class="btn btn-outline-success rounded-pill py-2 btn-block">Thanh toán</button>
						</div>
					</div>
				</div>

			</form>

		</div>

	</section>

	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>
