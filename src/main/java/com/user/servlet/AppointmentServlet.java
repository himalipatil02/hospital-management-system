package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.database.DBConnector;
import com.entity.Appointment;
@WebServlet("/appAppointment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_date = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctor_id = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");
		
		Appointment app = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "pending");
		AppointmentDao dao = new AppointmentDao(DBConnector.getcon());
		HttpSession session = req.getSession();
		if(dao.addappointment(app)) {
			session.setAttribute("succMsg", "Add appointment successfully");
			resp.sendRedirect("user_appointment.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Not Add appointment");
			resp.sendRedirect("user_appointment.jsp");
		}
	}

}
