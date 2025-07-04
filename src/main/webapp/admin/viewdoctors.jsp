<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import=" java.sql.Connection" %>
<%@ page import=" com.dao.SpecialistDao" %>
<%@ page import=" com.dao.DoctorDao" %>
<%@ page import=" com.database.DBConnector" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List" %>
<%@ page import ="com.entity.Specialist" %>
<%@ page import ="com.entity.Doctor" %>
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

	<div class="container-fulid p-3">
		<div class="row">
			
			<div class="col-md-12 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty succmsg }">
						 <p class="text-center text-success fs-3">${succmsg}</p>
						 <c:remove var="succmsg" scope="session"/>
						 </c:if>
						<c:if test="${not empty errormsg }">
						<p class="text-center text-danger fs-3">${errormsg}</p>
						<c:remove var="errormsg" scope="session"/>
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao dao2 = new DoctorDao(DBConnector.getcon());
								List<Doctor> list2 = dao2.getAllDoctor();
								for(Doctor d:list2)
								{%>
								<tr>
								
								<td>	<%=d.getFullname() %></td>
								<td>	<%=d.getDob() %></td>
								<td>	<%=d.getQualification() %></td>
								<td>	<%=d.getSpecialist()%></td>
								<td>	<%=d.getEmail() %></td>
								<td>	<%=d.getMobile() %></td>
								<td>	<%=d.getPassword() %></td>
								<td>	<a href="edit_doctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
										<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">delete</a>
								</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
	</div>
	</div>
</body>
</html>