<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%--<!-- Navigation-->--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <a class="navbar-brand" href="#!">Start Bootstrap</a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">--%>
<%--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="${base }/home">Home</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="#!">All Products</a></li>--%>
<%--                        <li><hr class="dropdown-divider" /></li>--%>
<%--                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            	<li class="nav-item"><a class="nav-link" href="${base }/contact">Contact</a></li>--%>
<%--            </ul>--%>
<%--            <form class="d-flex">--%>
<%--                <a class="btn btn-outline-dark" href="${base }/cart/checkout">--%>
<%--                    <i class="bi-cart-fill me-1"></i>--%>
<%--                    Cart--%>
<%--                    <span class="badge bg-dark text-white ms-1 rounded-pill" id="iconShowTotalItemsInCart">--%>

<%--                    </span>--%>
<%--                </a>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>


<%--<header class="header trans_300">--%>

    <!-- Top Navigation -->

    <div class="top_nav" style="background-color: #5f3f3f">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="top_nav_left">Doan Minh Duc's project</div>
                </div>
                <div class="col-md-6 text-right" style="background-color: #5f3f3f">
                    <div class="top_nav_right">
                        <ul class="top_nav_menu" >

                            <!-- Currency / Language / My Account -->

                            <li class="currency" style="background-color: #5f3f3f">
                                <a href="#" style="background-color: #5f3f3f">
                                    usd
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="currency_selection">
                                    <li><a href="#">cad</a></li>
                                    <li><a href="#">aud</a></li>
                                    <li><a href="#">eur</a></li>
                                    <li><a href="#">gbp</a></li>
                                </ul>
                            </li>
                            <li class="language" style="background-color: #5f3f3f">
                                <a href="#">
                                    English
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="language_selection">
                                    <li><a href="#">French</a></li>
                                    <li><a href="#">Italian</a></li>
                                    <li><a href="#">German</a></li>
                                    <li><a href="#">Spanish</a></li>
                                </ul>
                            </li>
                            <li class="account" style="background-color: #5f3f3f" >
                                <a href="#">
                                    My Account
                                    <i class="fa fa-angle-down"></i>
                                </a>
<%--                                <ul class="account_selection">--%>
<%--                                    <li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>--%>
<%--                                    <li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>--%>
<%--                                </ul>--%>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Navigation -->

    <div class="main_nav_container">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-right">
                    <div class="logo_container">
                        <a href="#" style="color: gold">thiendao<span style="color: silver">quan</span></a>
                    </div>
                    <nav class="navbar">
                        <ul class="navbar_menu">
                            <li><a class="nav-link active" aria-current="page" href="${base }/home">home</a></li>
                            <li><a href="#">shop</a></li>
                            <li><a href="#">promotion</a></li>
                            <li><a href="#">pages</a></li>
                            <li><a class="nav-link" href="${base }/blog">blog</a></li>
                            <li><a class="nav-link" href="${base }/contact">contact</a></li>
                        </ul>
                        <form class="d-flex">
                            <a class="btn btn-outline-danger" href="${base }/cart/checkout">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span class="badge bg-danger text-white ms-1 rounded-pill" id="iconShowTotalItemsInCart">
                                            ${totalItems } <!-- cung voi js , fix loi gio hang ko hien thi so luong -->
                                        </span>
                            </a>
                        </form>

                        <div style="padding-left: 20px">
                            <a class="" href="${base }/logout">Logout(${userLogined.email })</a>
                        </div>


                        <div class="hamburger_container">
                            <i class="fa fa-bars" aria-hidden="true"></i>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

<%--</header>--%>
