package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBCreate;
import com.zurion.web.tests.david.zurionweb.db.StampUtils;
import com.zurion.web.tests.david.zurionweb.model.Contact;

@WebServlet(
		asyncSupported = true, 
		description = "Creates a new Contact", 
		urlPatterns = { "/sudo/create/contact"})
public class SvContactCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SvContactCreate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_ADD.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String county = request.getParameter("county");
		int idNumber = Integer.parseInt(request.getParameter("idNumber"));
		Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
		String gender = request.getParameter("gender");
		Timestamp dateAdded = new Timestamp(System.currentTimeMillis());	//Timestamp.valueOf(request.getParameter("dateAdded"));
		String comments = request.getParameter("comments");
		String status = request.getParameter("status");


		Connection con = DBConnection.createConnection();
		Contact c = new Contact();
		c.setContactId(StampUtils.generateUniqueContactId(con));
		c.setFullName(fullName);
		c.setPhone(phone);
		c.setEmail(email);
		c.setCounty(county);
		c.setIdNumber(idNumber);
		c.setDateOfBirth(dateOfBirth);
		c.setGender(gender);
		c.setDateAdded(dateAdded);
		c.setComments(comments);
		c.setStatus(status);
		con = DBConnection.createConnection();	//Since connection is closed by above CodeUtil

		String error = "";

		try {
			DBCreate.createContact(con, c);
		} catch (SQLException ex) {
			ex.printStackTrace();
			error = ex.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}

		if(request.getParameter("submitMode") != null) {
			response.setContentType("text/html");
			String submitMode = request.getParameter("submitMode");
			
			if(submitMode.equals("formSubmittted")) {	
				if(!error.equals("")) {
					request.setAttribute("error", error);		
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_ADD.jsp");
					dispatcher.forward(request, response);
				} else {
					response.sendRedirect(request.getServletContext().getContextPath() + "/contact/" + c.getContactId());
				}
			} 
			
			else if(submitMode.equals("ajaxx")) {
				response.setContentType("text/plain");
				if(!error.equals("")) {
					response.getWriter().write("FAILED");
				} else {
					response.getWriter().write("SUCCESS");
				}
			}
		}
	}
}

