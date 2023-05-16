<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/12/2023
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
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
                        <th scope="col">Email</th>
                        <th scope="col">Message</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${contacts}" var="contacts" varStatus="loop">
                    <tr>
                        <th scope="row" width="5%">
                                ${loop.index + 1}
                        </th>
                        <td>
                                ${contacts.firstName} ${contacts.lastName}
                        </td>
                        <td>
                                ${contacts.email}
                        </td>
                        <td>
                                ${contacts.message }
                        </td>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

    <!-- JS -->
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>
