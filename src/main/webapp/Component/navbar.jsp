<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-hospital"></i>Medical Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <c:if test="${empty userObj }">
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp">
          <i class="fa-solid fa-right-to-bracket"></i>Admin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="user_login.jsp">User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="doctor_login.jsp">Doctor</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="user_appointment.jsp">Appointment</a>
        </li>
        </c:if>
       
       <c:if test="${not empty userObj }">
       	<li class="nav-item">
          <a class="nav-link active" href="user_appointment.jsp">Appointment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="view_appointment.jsp">view Appointment</a>
        </li>
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fa-solid fa-user"></i> ${userObj.fullName }
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="changePassword.jsp">Change password</a></li>
            <li><a class="dropdown-item" href="userLogoutServlet">Logout</a></li>
         </ul>
        </li>
       </c:if> 
        
        
      </ul>
     
    </div>
  </div>
</nav>