package com.admin.servlet;

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
@WebServlet("/updateDoctorServlet")
public class UpdateDoctor extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullName");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String password = req.getParameter("password");
		int id = Integer.parseInt(req.getParameter("id"));
		
		Doctor d = new Doctor(id,fullname, dob, qualification, specialist, email, mobile, password);
		DoctorDao dao= new DoctorDao(DBConnector.getcon());
		HttpSession session = req.getSession();
		if(dao.doctorupdate(d)) {
			session.setAttribute("succmsg","update Doctor Successful");
			resp.sendRedirect("admin/viewdoctors.jsp");
		}
		else {
			session.setAttribute("errormsg","Something went wrong");
			resp.sendRedirect("admin/viewdoctors.jsp");
		}
	}

}
