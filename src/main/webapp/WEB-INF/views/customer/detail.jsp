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
            transform: scale(1.5); /* cỡ zoom khi di chuột vào */
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

    <!-- Page content-->
    <div class="container">
        <h3 class="mt-4" style="color: #8a6d3b"> ${product.title} </h3>
        <br/>
        <br/>
        <div class="row">

            <div class="col-4">

                <div class="thu-nghiem-zoom">
                    <img alt="" style="width: 300px; height: 300px;" src="${base }/upload/${product.avatar}">
                </div>
            </div>
            <div class="col-8 ">
                <h4 class="mt-4"> Tên sản phẩm :  ${product.title} </h4>
                <h4 class="mt-4"> Thể loại :  ${product.categories.name} </h4>
                <h4 class="mt-4"> Giá bán :  ${product.priceSale} VNĐ </h4>
                <h4 class="mt-4"> Chi tiết :  ${product.details} </h4>
                <h4 class="mt-4"> Ảnh thêm </h4>

                <div class="form-group">
                    <c:forEach items="${product.productImages }" var="productImage">
<%--                        <div class="thu-nghiem-zoom">--%>
                            <img lass="" alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
<%--                        </div>--%>
                    </c:forEach>
                </div>

            </div>
        </div>
        <div class="text-center">
            <a class="red_button " style="width: 175px ; height: 50px" href="#" onclick="AddProductToCart('${base}', ${product.id }, 1)">
                Add to cart
            </a>
        </div>
    </div>

    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

    <!-- JS -->
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>