
<%@page import="com.entity.UserGetSet"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.database.DBConnector"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="Component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								UserGetSet user = (UserGetSet) session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DBConnector.getcon());
								DoctorDao dao1 = new DoctorDao(DBConnector.getcon());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for(Appointment app:list){
									Doctor d = dao1.getAllDoctorbyId(app.getDoctorId());
								%>
								<tr>
									<th><%=app.getFullName() %></th>
									<td><%=app.getGender() %></td>
									<td><%=app.getAge() %></td>
									<td><%=app.getAppoinDate() %></td>
									<td><%=app.getDiseases() %></td>
									<td><%=d.getFullname() %></td>
									<td>
									
									
									 <%
									 if("pending".equals(app.getStatus())){ %>
									
										<a href="#" class="btn btn-sm btn-warning">pending</a>										 
									 
									 <% }
									 else{
									 %>
									 <%=app.getStatus() %>
									<%	 
									 } %>
								
								<%									
								}
								%>
								</td>
								</tr>
								
										
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img alt="" src="img/doct.jpg">
			</div>
		</div>
	</div>
</body>
</html>