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
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						<c:if test="${not empty succmsg }">
						 <p class="text-center text-success fs-3">${succmsg}</p>
						 <c:remove var="succmsg" scope="session"/>
						 </c:if>
						<c:if test="${not empty errormsg }">
						<p class="text-center text-danger fs-3">${errormsg}</p>
						<c:remove var="errormsg" scope="session"/>
						</c:if>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnector.getcon());
						Doctor d = dao2.getAllDoctorbyId(id);
						%>
						<form action="../updateDoctorServlet" method="post">
						
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name="fullName" class="form-control" value=<%=d.getFullname()  %>>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="dob" required name="dob" class="form-control" value=<%=d.getDob() %>>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" required name="qualification" value=<%=d.getQualification()%> class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select required class="form-control" name="specialist">
								<option><%=d.getSpecialist() %></option>
								<%
									SpecialistDao dao = new SpecialistDao(DBConnector.getcon());
								List<Specialist> list = dao.getAllSpecialist();
								for(Specialist s:list)
								{%>
									<option><%=s.getSpecialistName() %></option>
								<%
								}
								%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" required name="email" value=<%=d.getEmail()  %> class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">mobile no</label>
								<input type="text" required name="mobile" class="form-control"value=<%=d.getMobile()  %>>
							</div>
							<div class="mb-3">
								<label class="form-label">password</label>
								<input type="password" required name="password" class="form-control" value=<%=d.getPassword()  %>>
							</div>
							<input type="hidden" name="id" value=<%=d.getId() %>>
							<button type="submit"class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
	</div>
	</div>
</body>
</html>