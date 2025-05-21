package com.zurion.web.tests.david.zurionweb.context;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
		asyncSupported = true, 
		description = "Discards user from Session.", 
		urlPatterns = { "/logout", "/sudo/logout", "/staff/logout"})
public class SvLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SvLogout() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session != null) {
			SessionManager.storeLoggedUser(session, null);
			
    		response.setContentType("text/html");
    		response.sendRedirect(request.getContextPath() + "/");
    		return;
		} else {
			response.sendRedirect(this.getServletContext().getContextPath());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
