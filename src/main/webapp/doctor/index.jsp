<%@page import="com.entity.Doctor"%>
<%@page import="com.database.DBConnector"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../Component/css.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<p class="text-center fs-3">Doctor Dashboard</p>
<% 
Doctor doctor = (Doctor)session.getAttribute("doctObj");
DoctorDao dao = new DoctorDao(DBConnector.getcon());

%>
<div class="container p-5">
 <div class="row">
 <div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Doctor <br><%=dao.countAllDoctors() %></p>
					</div>
				</div>
			</div>

 <div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Total appointment <br><%=dao.countAllAppointmentById(doctor.getId()) %></p>
					</div>
				</div>
			</div>
 </div>
</div>
 </div>

</body>
</html>