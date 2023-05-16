<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>AdminContact</title>
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


                    <%--                    <!-- phân trang -->--%>
                    <%--                    <div class="row">--%>
                    <%--                        <div class="col-12 d-flex justify-content-center">--%>
                    <%--                            <div id="paging"></div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Họ và tên</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Giá trị đơn hàng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${saleOder}" var="saleOder" varStatus="loop">
                        <tr>
                            <th scope="row" width="5%">
                                    ${loop.index + 1}
                            </th>
                            <td>
                                    ${saleOder.customerName}
                            </td>
                            <td>
                                    ${saleOder.customerPhone}
                            </td>
                            <td>
                                    ${saleOder.customerAddress }
                            </td>
                            <td>
                                    ${saleOder.total }
                            </td>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                            <div id="paging"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS -->
        <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
        <script type="text/javascript">
            $( document ).ready(function() {

                $(function() {
                    $("#paging").pagination({
                        currentPage: ${saleOder2.currentPage}, 	//trang hiện tại
                        items: ${saleOder2.totalItems},			//tổng số sản phẩm
                        itemsOnPage: ${saleOder2.sizeOfPage}, 	//số sản phẩm trên 1 trang
                        cssStyle: 'light-theme',
                        onPageClick: function(pageNumber, event) {
                            $('#page').val(pageNumber);
                        },
                    });
                });
            });
        </script>
    </body>
</html>