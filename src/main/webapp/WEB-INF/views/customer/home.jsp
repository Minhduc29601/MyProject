<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
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
        
        <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
        
        <title>Shop Homepage - Start Bootstrap Template</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <!-- Css -->
        <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

        <style>
            .thu-nghiem-zoom img{
                display:block;
                transition: all .3s ease;
            }
            .thu-nghiem-zoom img:hover{
                transform: scale(1.3); /* cỡ zoom khi di chuột vào */
            }
            .thu-nghiem-zoom div{
                display:block;
                overflow: hidden;
            }
        </style>
    </head>
    <body>
    
        <!-- Navigation-->
        <jsp:include page="/WEB-INF/views/customer/layout/menu.jsp"></jsp:include>
        
        <!-- Header-->
        <header class="container-fluid" >
                <img style="width: 1328px; height: 480px;" class="" src="${base }/img/ThuVienAnhDAi.jpg" alt="">
        </header>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    <c:forEach var="product" items="${products }">
			         	<div class="product-item accessories" style="background-color: #EDDFB3">
                            <div class="product product_filter">
	                            <!-- Sale badge-->
                                <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>sale</span></div>
	                            <!-- Product image-->
                                <a href="${base }/home/detail/${product.id}" target="_blank">
<%--                                    <div class="thu-nghiem-zoom">--%>
                                        <img class="card-img-top" alt="" style="width: 214px; height: 214px;" src="${base }/upload/${product.avatar}" />
<%--                                    </div>--%>

                                </a>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${product.title }</h5>
	                                    <!-- Product reviews-->
	                                    <div class="d-flex justify-content-center small text-warning mb-2">
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                    </div>
	                                    <!-- Product price-->
	                                    <fmt:setLocale value="VND"/>
										<span class="text-muted text-decoration-line-through">
	                                    	<fmt:formatNumber value="${product.price}" type="currency"/>
                                    	</span>
	                                    <fmt:formatNumber value="${product.priceSale}" type="currency"/>
	                                </div>
                                    <!-- Product actions-->
                                    <div class="text-center">
                                        <a class="red_button add_to_cart_button" href="#" onclick="AddProductToCart('${base}', ${product.id }, 1)">
                                            Add to cart
                                        </a>
                                    </div>
	                            </div>


	                        </div>
	                    </div>

			        </c:forEach>
                </div>
            </div>
        </section>

        
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
        
        <!-- JS -->
        <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
        
        <script type="text/javascript">
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
        
    </body>
</html>
