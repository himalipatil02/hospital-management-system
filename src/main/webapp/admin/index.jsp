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
<%@include file="../Component/css.jsp" %>
<style type="text/css">
	.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
	<c:if test="${empty adminObj }">
	<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		 <c:if test="${not empty succmsg }">
		 <p class="text-center text-success fs-3">${succmsg}</p>
		 <c:remove var="succmsg" scope="session"/>
		 </c:if>
		<c:if test="${not empty errormsg }">
		<p class="text-center text-danger fs-3">${errormsg}</p>
		<c:remove var="errormsg" scope="session"/>
		</c:if>
		<%DoctorDao dao = new DoctorDao(DBConnector.getcon()); %>
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
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">User <br><%=dao.countAllUsers() %></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Total Appointment <br><%=dao.countAllAppointment() %></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Specialist<br><%=dao.countAllSpecialist() %></p>
					</div>
				</div>
			</div>
		</div>
		
	</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="../addSpecialist" method="post">
        <div>
        	<label>Add Specialist Doctor</label>
        	<input type="text" name="specialName"class="form-control">
        </div>
        <div class="text-center mt-3">
        	<button type="submit" class="btn btn-primary ">Add</button>
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
</body>
</html>