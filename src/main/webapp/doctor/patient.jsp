<%@page import="com.database.DBConnector"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../Component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						Doctor doc =  (Doctor)session.getAttribute("doctObj");
						AppointmentDao dao = new AppointmentDao(DBConnector.getcon());
						DoctorDao dao2 = new DoctorDao(DBConnector.getcon());
						List<Appointment> list = dao.getAllAppointmentByDoctorId(doc.getId());
						for (Appointment ap  : list) {
							Doctor d = dao2.getAllDoctorbyId(ap.getDoctorId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>

							<td><%=ap.getStatus()%></td>
							<td><a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a></td>
						</tr>
						<%
						}
						%>

						
					</tbody>
				</table>
					
			</div>
		</div>
	</div>
</body>
</html>