package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.database.DBConnector;
import com.entity.Doctor;
import com.entity.UserGetSet;
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		DoctorDao dao = new DoctorDao(DBConnector.getcon());
		Doctor doctor = dao.login(email, password);
		if(doctor!=null) {
			session.setAttribute("doctObj",doctor);
			resp.sendRedirect("doctor/index.jsp");
		}
		else {
			session.setAttribute("errormsg","Invalid Email and Password");
			resp.sendRedirect("doctor_login.jsp");
		}
	}
}
