<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Component/css.jsp" %>
</head>
<body>
<%@include file="Component/navbar.jsp" %>
<section class="vh-100" style="background-color: gray;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <h3 class="mb-5">Admin Login</h3>
            <c:if test="${not empty succmsg }">
								<p class="text-center text-success fs-3">${succmsg}</p>
								<c:remove var="succmsg" scope="session"/>
							</c:if>
							<c:if test="${not empty errormsg }">
								<p class="text-center text-danger fs-3">${errormsg}</p>
								<c:remove var="errormsg" scope="session"/>
							</c:if>
			<form action="adminloginServlet" method="post">
            <div data-mdb-input-init class="form-outline mb-4">
              <label class="form-label" for="typeEmailX-2">Email</label>
              <input type="email" name="email" class="form-control form-control-lg" />
            </div>

            <div data-mdb-input-init class="form-outline mb-4">
              <label class="form-label" for="typePasswordX-2">Password</label>
              <input type="password" name="password" class="form-control form-control-lg" />
            </div>
            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

            <hr class="my-4">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>