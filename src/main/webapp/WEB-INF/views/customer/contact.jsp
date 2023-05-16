<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
        
        <!-- Csss -->
        <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    </head>
    <body>
    
        <!-- Navigation-->
        <jsp:include page="/WEB-INF/views/customer/layout/menu.jsp"></jsp:include>
        
        <!-- Header-->
        <header class="container-fluid" >
            <img style="width: 1328px; height: 480px;" class="" src="${base }/img/mai_anh_ngang.jpg" alt="">
        </header>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">           	 		
			        <div class="col">
			        	<div class="card">
			                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Contact us.</div>
			                <div class="card-body">
			                	<%-- <div>
			                		${message }
			                	</div>
			                	<div>
			                		<c:forEach var = "employee" items="${employees }">
							        	Nhân viên: ${employee.maNv} - ${employee.tenNv } <br/>
							        </c:forEach>
			                	</div>
			                	
			                	<!-- simple-form -->
			                	<form action="${base }/contact" method="post">
			                        <div class="form-group mb-2">
			                            <label for="firstName">Họ và tên</label>
			                            <input type="text" class="form-control" name="fullName" id="idFullName" placeholder="Họ và tên" required>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="email">Địa chỉ Email</label>
			                            <input type="email" class="form-control" name="email" id="idEmail" placeholder="Email" required>
			                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="message">Nội dung liên hệ</label>
			                            <textarea class="form-control" name="message" id="idMessage" rows="6" required></textarea>
			                        </div>
			                        
			                        <div class="mx-auto mb-2">
			                        	<button type="submit" class="btn btn-primary text-right">Submit</button>
			                        </div>
			                    </form> --%>
			                    
			                    <!-- spring-form -->
			                    <!-- mapping html form => object contact -->
			                    <sf:form modelAttribute="contactModel" action="${base }/contact-spring-form" method="post">
			                        <div class="form-group mb-2">
			                            <label for="firstName">Họ</label>
			                            <sf:input path="firstName" class="form-control" name="firstName" id="idFirstName" placeholder="Họ"></sf:input>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="lastName">Tên</label>
			                            <sf:input path="lastName" class="form-control" name="lastName" id="idLastName" placeholder="Tên"></sf:input>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="email">Địa chỉ Email</label>
			                            <sf:input path="email" class="form-control" name="email" id="idEmail" placeholder="Email"></sf:input>
			                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="message">Nội dung liên hệ</label>
			                            <sf:textarea path="message" class="form-control" name="message" id="idMessage" rows="6"></sf:textarea>
			                        </div>
			                        
			                        <div class="mx-auto mb-2">
			                        	<button type="submit" class="btn btn-primary text-right">Submit</button>
			                        </div>
			                    </sf:form>
			                    
			                    <!-- ajax-form -->
			                    <!-- <form>
			                        <div class="form-group mb-2">
			                            <label for="firstName">Họ</label>
			                            <input type="text" class="form-control" name="firstName" id="idFirstName" placeholder="Họ" required>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="lastName">Họ</label>
			                            <input type="text" class="form-control" name="lastName" id="idLastName" placeholder="Tên" required>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="email">Địa chỉ Email</label>
			                            <input type="email" class="form-control" name="email" id="idEmail" placeholder="Email" required>
			                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			                        </div>
			                        <div class="form-group mb-2">
			                            <label for="message">Nội dung liên hệ</label>
			                            <textarea class="form-control" name="message" id="idMessage" rows="6" required></textarea>
			                        </div>
			                        
			                        <div class="mx-auto mb-2">
			                        	<button type="button" onclick="Submit_Click();" class="btn btn-primary text-right">Submit</button>
			                        </div>
			                    </form> -->
			                    
			                </div>
		                </div>
	                </div>
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
        
        <!-- JS -->
        <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
        
        <script type="text/javascript">
        	function Submit_Click() {
        		// javascript object.
        		let data = {
        			firstName: 	$( "#idFullName" ).val(),
        			lastName: 	$( "#idLastName" ).val(),
       				email: 		$( "#idEmail" )	  .val(),
       				message: 	$( "#idMessage" ) .val(),
        		};
        		
        		// json == javascript object
        		jQuery.ajax({
        			url: 			"${base}/contact-ajax",
        			type: 			"post",
        			contentType: 	"application/json",
        			data: 			JSON.stringify(data),

        			dataType: 		"json",
        			success: function(jsonResult) {
        				alert(jsonResult.statusMessage)
        			},
        			error: function(jqXhr, textStatus, errorMessage) {
        				
        			}
        		});
        	}        
        </script>
        
    </body>
</html>
