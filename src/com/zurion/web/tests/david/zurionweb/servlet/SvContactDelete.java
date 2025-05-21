package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zurion.web.tests.david.zurionweb.context.SessionManager;
import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBRead;
import com.zurion.web.tests.david.zurionweb.db.DBUpdate;
import com.zurion.web.tests.david.zurionweb.db.StampUtils;
import com.zurion.web.tests.david.zurionweb.model.Contact;
import com.zurion.web.tests.david.zurionweb.model.Entity;

@WebServlet(
		asyncSupported = true, 
		description = "Delete Contact", 
		urlPatterns = { "/sudo/contact/delete/*"})
public class SvContactDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SvContactDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Contact> cList = new ArrayList<>();

		Connection con = DBConnection.createConnection();
		String error = "";

		try {
			cList = DBRead.getContactList(con);  //SessionManager.getLoggedUser(request.getSession()).getUserId()
		} catch (SQLException e) {
			e.printStackTrace();
			error = e.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}

		request.setAttribute("error", error);
		request.setAttribute("cList", cList);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_LIST.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int contactID = Integer.parseInt(StampUtils.getResourceID(request));
		
		Connection con = DBConnection.createConnection();

		String error = "";
		
		Entity et = new Entity();
		et.setEntityID(contactID);
		et.setTableName("contact");
		et.setColumn("CONTACT_ID");			//The matching criteria pattern, mostly primary key
		
		boolean isDeleted = false;
		try {
			isDeleted = DBUpdate.deleteResource(con, et);
		} catch (SQLException ex) {
			ex.printStackTrace();
			error = ex.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}
		
		//Assuming the request is AJAX, return text response
		response.setContentType("text/html");
		if(isDeleted == false || error!= "") {
			response.getWriter().append("DEL_FAILED");
		} else {
			//response.sendRedirect(request.getServletContext().getContextPath() + "/contact/" + c.getContactId());
			response.getWriter().append("DEL_OKAY");
		}
	}
}


