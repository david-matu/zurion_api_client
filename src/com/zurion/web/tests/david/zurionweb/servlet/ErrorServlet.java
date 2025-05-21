package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		asyncSupported = true, 
		description = "Serve to Show User an error has occurred, or a 404", 
		urlPatterns = { "/error"})
public class ErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ErrorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/ERROR.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
