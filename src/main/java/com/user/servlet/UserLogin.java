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
@WebServlet("/userloginServlet")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			UserDao dao = new UserDao(DBConnector.getcon());
			UserGetSet user = dao.login(email, password);
			
			
			if(user!=null) {
				session.setAttribute("userObj", user);
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("errormsg", "invalid email and password");
				resp.sendRedirect("user_login.jsp");
				
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}


