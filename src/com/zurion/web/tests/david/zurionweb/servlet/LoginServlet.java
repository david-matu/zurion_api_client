package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zurion.web.tests.david.zurionweb.context.SessionManager;
import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBRead;
import com.zurion.web.tests.david.zurionweb.db.FindUtils;
import com.zurion.web.tests.david.zurionweb.model.User;
import com.zurion.web.tests.david.zurionweb.util.TemporaryUtils;

@WebServlet(
		asyncSupported = true, 
		description = "Handles Logins", 
		urlPatterns = { "/signin", "/sign-in", "/login"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
				
		request.setAttribute("pageTitle", "Application Endpoints");
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/LOGIN.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextURL = request.getParameter("nextURL") != null ? request.getParameter("nextURL") : "";
		String submitMode = request.getParameter("smode") != null ? request.getParameter("smode") : "";
		
		//System.out.println("Login attempt by user @" + new Timestamp(System.currentTimeMillis()) + "\nMode: " + submitMode);
		
		Connection con = DBConnection.createConnection();
		String userID = request.getParameter("userID") != null ? request.getParameter("userID") : "";
		String password = request.getParameter("userPad") != null ? request.getParameter("userPad") : "";
		
		if(userID == "" || password == "") {
			if(submitMode != "") {
				if(submitMode.equalsIgnoreCase("formSubmit")) {		//Submitted via 'action' form mode
					// Return with same page with feedback
					request.setAttribute("loginFeedback", "Please fill the login form");
					
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/LOGIN.jsp");
					dispatcher.forward(request, response);
				} else if (submitMode.equalsIgnoreCase("ajax")){
					response.getWriter().write("FILL_DETAILS");
					return;
				}
				return;
			}
		} else { //User ID and Password supplied
			if(submitMode != "") {
				User user = TemporaryUtils.getUserByCredentials(userID, password);
				
				
				if(user == null) {
					if(submitMode.equalsIgnoreCase("formSubmit")) {		//Submitted via 'action' form mode
						response.setContentType("text/html");
						
						// Return with same page with feedback
						request.setAttribute("loginFeedback", "Incorrect credentials");
						
						RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/LOGIN.jsp");
						dispatcher.forward(request, response);
					} else if (submitMode.equalsIgnoreCase("ajax")){					
						response.getWriter().write("INVALID_CREDENTIALS");
					}
				}
				
				// User is valid
				SessionManager.storeLoggedUser(session, user);
				
				if(submitMode.equalsIgnoreCase("formSubmit")) {		//Submitted via 'action' form mode
					response.setContentType("text/html");
					
					// Return with same page with feedback
					request.setAttribute("loginFeedback", "Logon successful");
					
					response.sendRedirect(request.getServletContext().getContextPath());
				} else if (submitMode.equalsIgnoreCase("ajax")){
					if(user == null) {
						response.getWriter().write("INVALID_CREDENTIALS");
						return;
					}
					
					response.getWriter().write("SUCCESS");
					return;
				}
			} else {
				response.getWriter().write("UNRECOGNIZED_LOGIN");
			}
		}
	}

}

