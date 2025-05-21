package com.zurion.web.tests.david.zurionweb.context;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		asyncSupported = true, 
		description = "Change the URL for the static resources used by the frontend", 
		urlPatterns = { "/deployment/context"})
public class SvContextManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SvContextManager() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();		
		request.setAttribute("activeLinkHome", "active");
		
				
		request.setAttribute("pageTitle", "Control Panel :::: Deployment Context");
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/INDEX_CONTEXT.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * This methods updates the URL indicating location of resources to be loaded (Js, CSS, Images)
	 * 	Aimed at improving site speed
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextURL = request.getParameter("contextURL") != null || request.getParameter("contextURL") != "" ? request.getParameter("contextURL") : "webapp";
		
		ServletContext ctx = request.getServletContext();
		if(contextURL.equalsIgnoreCase("contextCloud")) {
			ctx.setAttribute("assets", "http://d3b9eqxzrvw9g6.cloudfront.net");
		} else if(contextURL.equalsIgnoreCase("contextWeb")) {
			ctx.setAttribute("assets", request.getServletContext().getContextPath() + "/assets");
		}
		
		System.out.println("Serving static resources with the following URL: \n" + ctx.getAttribute("assets"));
		
		request.setAttribute("msg", "The system will now serve static resources with :::: " + ctx.getAttribute("assets"));
		
		request.setAttribute("pageTitle", "Control Panel :::: Deployment Context");		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/INDEX_CONTEXT.jsp");
		dispatcher.forward(request, response);
	}

}
