<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <style type="text/css">
        *{
            margin:0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        section{
            position: relative;
            width: 100%;
            height: 100vh;
            display: flex;
        }

        section .img-bg{
            position: relative;
            width: 50%;
            height: 100%;
        }



        section .img-bg img{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        section .noi-dung{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50%;
            height: 100%;
        }

        section .noi-dung .form{
            width: 50%;
        }


        section .noi-dung .form h2{
            color: #607d8b;
            font-weight: 500;
            font-size: 1.5em;
            text-transform: uppercase;
            margin-bottom: 20px;
            border-bottom: 4px solid #ff4584;
            display: inline-block;
            letter-spacing: 1px;

        }

        section .noi-dung .form .input-form{
            margin-bottom: 20px;
        }


        section .noi-dung .form .input-form span{
            font-size: 16px;
            margin-bottom: 5px;
            display: inline-block;
            color: #607db8;
            letter-spacing: 1px;

        }

        section .noi-dung .form .input-form input{
            width: 100%;
            padding: 10px 20px;
            outline: none;
            border: 1px solid #607d8b;
            font-size: 16px;
            letter-spacing: 1px;
            color: #607d8b;
            background: transparent;
            border-radius: 30px;

        }
        section .noi-dung .form .input-form input[type="submit"]{
            background: #ff4584;
            color: #fff;
            outline: none;
            border: none;
            font-weight: 500;
            cursor: pointer;
            box-shadow: 0 1px 1px rgba(0,0,0,0.12),
            0 2px 2px rgba(0,0,0,0.12),
            0 4px 4px rgba(0,0,0,0.12),
            0 8px 8px rgba(0,0,0,0.12),
            0 16px 16px rgba(0,0,0,0.12);
        }

        section .noi-dung .form .input-form input[type="submit"]:hover{
            background: #f53677;
        }
        section .noi-dung .form .nho-dang-nhap{
            margin-bottom: 10px;
            color: #607d8b;
            font-size: 14px;
        }

        section .noi-dung .form .input-form p{
            color: #607d8b;
        }

        section .noi-dung .form .input-form p a{
            color: #ff4584;
        }

        section .noi-dung .form h3{
            color: #607d8b;
            text-align: center;
            margin: 80px 0 10px;
            font-weight: 500;
        }

        section .noi-dung .form .icon-dang-nhap{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        section .noi-dung .form .icon-dang-nhap li{
            list-style: none;
            cursor: pointer;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        section .noi-dung .form .icon-dang-nhap li:nth-child(1){
            color: #3b5999;
        }
        section .noi-dung .form .icon-dang-nhap li:nth-child(2){
            color: #dd4b39;
        }
        section .noi-dung .form .icon-dang-nhap li:nth-child(3){
            color: #55acee;
        }
        section .noi-dung .form .icon-dang-nhap li i{
            font-size: 24px;

        }

        @media (max-width: 768px){
            section .img-bg{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
            section .noi-dung{
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100%;
                z-index: 1;
            }
            section .noi-dung .form{
                width: 100%;
                padding: 40px;
                background: rgba(255 255 255 / 0.9);
                margin: 50px;
            }
            section .noi-dung .form h3{
                color: #607d8b;
                text-align: center;
                margin: 30px 0 10px;
                font-weight: 500;
            }
        }
    </style>
</head>
<body>
    <section>
        <!--Bắt Đầu Phần Hình Ảnh-->
        <div class="img-bg">
            <img src="${base }/img/anhdangnhap.jpg" alt="Hình Ảnh Minh Họa">
        </div>
        <!--Kết Thúc Phần Hình Ảnh-->
        <!--Bắt Đầu Phần Nội Dung-->
        <div class="noi-dung">
            <div class="form">
                <h2>Đăng Ký</h2>
                <sf:form modelAttribute="user" action="${base }/register" method="post" enctype="multipart/form-data">
                    <div style="color: red;font-style:italic">
                            ${message}
                    </div>
                    <div class="input-form">
                        <sf:input type="text" path="username" id="username" class="form-control" placeholder="Username"></sf:input>
                    </div>
                    <div class="input-form">
                        <sf:input type="text" path="email" id="email" class="form-control" placeholder="Gmail"></sf:input>
                    </div>
                    <div class="input-form">
                        <sf:input type="text" path="phone" id="phone" class="form-control" placeholder="Số điện thoại"></sf:input>
                    </div>
                    <div class="input-form">
                        <sf:input type="text" path="shippingAddress" id="street" class="form-control" placeholder="Nhập địa chỉ"></sf:input>
                    </div>
                    <div class="input-form">
                        <sf:input type="password" path="password" id="password" class="form-control" placeholder="Nhập mật khẩu"></sf:input>
                    </div>
                    <div class="input-form">
                        <input type="submit" value="Đăng ký">
                    </div>
                    <div class="input-form">
                            Bạn đã có tài khoản? <a href="${base }/login">Đăng nhập</a>
                    </div>
                </sf:form>
            </div>
        </div>

<%--<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>--%>
</body>
</html>