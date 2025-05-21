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

import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBRead;
import com.zurion.web.tests.david.zurionweb.db.StampUtils;
import com.zurion.web.tests.david.zurionweb.model.Contact;


@WebServlet(
		asyncSupported = true, 
		description = "Read single Contact", 
		urlPatterns = { "/sudo/show/contact/*"})
public class SvContactShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SvContactShow() {
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

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_VIEW.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}

