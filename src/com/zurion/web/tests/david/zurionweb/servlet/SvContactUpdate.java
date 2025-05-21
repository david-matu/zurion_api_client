package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBRead;
import com.zurion.web.tests.david.zurionweb.db.DBUpdate;
import com.zurion.web.tests.david.zurionweb.db.StampUtils;
import com.zurion.web.tests.david.zurionweb.model.Contact;

@WebServlet(
		asyncSupported = true, 
		description = "For Updating Contact", 
		urlPatterns = { "/sudo/update/contact/*"})
public class SvContactUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SvContactUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int entityID = Integer.parseInt(StampUtils.getResourceID(request));

		Contact c = null;

		Connection con = DBConnection.createConnection();
		String error = "";

		try {
			c = DBRead.getContact(con, entityID);
		} catch (SQLException ex) {
			ex.printStackTrace();
			error = ex.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}

		request.setAttribute("error", error);
		request.setAttribute("Contact", c);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_UPDATE.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int entityID = Integer.parseInt(StampUtils.getResourceID(request));

		int contactId = Integer.parseInt(request.getParameter("contactId"));
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
		Contact c = null;

		try {
			c = DBRead.getContact(con, contactId);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		c.setContactId(contactId);
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
		String error = "";

		try {
			DBUpdate.updateContact(con, c);
		} catch (SQLException ex) {
			ex.printStackTrace();
			error = ex.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}

		if(request.getParameter("submitMode") != null) {
			response.setContentType("text/html");	
			if(!error.equals("")) {
				request.setAttribute("error", error);		
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_UPDATE.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect(request.getServletContext().getContextPath() + "/contact/" + c.getContactId());
				
			}
		} else { //There's no direct form submission indicated
			response.setContentType("text/plain");	
			if(!error.equals("")) {
				response.getWriter().append("UPDATE_FAILED");
			} else {
				response.getWriter().append("UPDATE_OKAY");
			}
		}
	}
}

