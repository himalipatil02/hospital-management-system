package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.database.DBConnector;
import com.entity.UserGetSet;
@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		UserGetSet u = new UserGetSet(name, email, password);
		UserDao dao = new UserDao(DBConnector.getcon());
		boolean f = dao.userRegister(u);
		
		if(f=true) {
			session.setAttribute("succmsg", "Successful data inserted");
			resp.sendRedirect("signup.jsp");
		}
		else {
			session.setAttribute("errormsg", "Failed to data inserted");
			resp.sendRedirect("signup.jsp");
			
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
