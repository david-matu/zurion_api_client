package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRegistration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		asyncSupported = true, 
		description = "Shows endpoint URLs", 
		urlPatterns = { "/endpoints"})
public class Endpoints extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Endpoints() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		Map<String, ? extends ServletRegistration> servletRegistrations = request.getServletContext().getServletRegistrations();
		
		String allServlets = "";
		
		List<String> endPoints = new ArrayList<>();
		List<String> servlets = new ArrayList<>();
		
		for(Map.Entry<String, ? extends ServletRegistration> entry : servletRegistrations.entrySet()) {
			allServlets +=  Arrays.toString(entry.getValue().getMappings().toArray()) +  " :::::::::::::::::::::::::::::::::::::::: " + entry.getKey() + "\n\n <br>";
			//endPoints.add(Arrays.toString(entry.getValue().getMappings().toArray()));
			//entry.getValue().getMappings().toArray();
			
			String mapping = Arrays.toString(entry.getValue().getMappings().toArray());
			String fullMappings = mapping.replaceAll("\\[", "").replaceAll("\\]","");
			String[] arr = fullMappings.split(",");
			
			//System.out.println("Full Mapping ::::: " +  fullMappings);
			
			for(String m : arr) {
				endPoints.add(m.trim());
				//System.out.println("Mapping ::::: " +  m.trim());
			}
			
			servlets.add(entry.getKey());
		}
		
		Collections.sort(endPoints);
		
		request.setAttribute("pageTitle", "Application Endpoints");
		request.setAttribute("endpoints", allServlets);
		request.setAttribute("servlets", servlets);
		request.setAttribute("endpointURLs", endPoints);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/INDEX_ENDPOINTS.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

