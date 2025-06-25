package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dao.DoctorDao;
import com.database.DBConnector;
import com.entity.Appointment;
import com.entity.Doctor;

@WebServlet("/updateComment")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int docid = Integer.parseInt(req.getParameter("did"));
		String comment = req.getParameter("comm");
		
		HttpSession session = req.getSession();
		AppointmentDao dao = new AppointmentDao(DBConnector.getcon());
		boolean ap = dao.updateComment(id, docid, comment);
		if(ap=true) {
			session.setAttribute("succMsg","Comment Updated");
			resp.sendRedirect("doctor/patient.jsp");
		}
		else {
			session.setAttribute("errorMsg","Someting wrong on server");
			resp.sendRedirect("doctor/patient.jsp");
		}
	}

}
