package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRegistration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.zurion.web.tests.david.zurionweb.db.DBConnection;
import com.zurion.web.tests.david.zurionweb.db.DBRead;
import com.zurion.web.tests.david.zurionweb.model.Contact;

@WebServlet(
		asyncSupported = true, 
		description = "Serves Home (Welcome) Page", 
		urlPatterns = { "/home", "/index", "/"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		Map<String, ? extends ServletRegistration> servletRegistrations = request.getServletContext().getServletRegistrations();
		
		String allServlets = "";
		
		for(Map.Entry<String, ? extends ServletRegistration> entry : servletRegistrations.entrySet()) {
			allServlets +=  Arrays.toString(entry.getValue().getMappings().toArray()) +  " :::::::::::::::::::::::::::::::::::::::: " + entry.getKey() + "\n\n <br>";
		}
		
		
		request.setAttribute("endpoints", allServlets);
		
		
		List<Contact> recentContactList = new ArrayList<>();
		List<Contact> allContacts = new ArrayList<>();
		int totalContacts = 0;
		
		Connection con = DBConnection.createConnection();
		String error = "";

		try {
			recentContactList = DBRead.getRecent5ContactList(con);
			
			// Find out the total contacts
			allContacts = DBRead.getContactList(con);
			totalContacts = allContacts.size();
		} catch (SQLException e) {
			e.printStackTrace();
			error = e.getLocalizedMessage();
		} finally {
			DBConnection.closeConnection(con);
		}
		
		
		// Organize data for graphs
		Map<String, Integer> genderCounts = new HashMap<>();
		genderCounts.put("Male", 0);
		genderCounts.put("Female", 0);
		genderCounts.put("Other", 0); // catch-all for non-Male/Female if needed
		
		// By county
		Map<String, Integer> countyCounts = new HashMap<>();
		
		for (Contact contact : allContacts) {
		    String gender = contact.getGender();
		    if (gender == null) continue;
		    
		    switch (gender.trim().toLowerCase()) {
		        case "male":
		            genderCounts.put("Male", genderCounts.get("Male") + 1);
		            break;
		        case "female":
		            genderCounts.put("Female", genderCounts.get("Female") + 1);
		            break;
		        default:
		            genderCounts.put("Other", genderCounts.get("Other") + 1);
		            break;
		    }
		    
		    // Build for graph by gender
		    String county = contact.getCounty();
		    if (county != null && !county.trim().isEmpty()) {
		        county = county.trim();
		        countyCounts.put(county, countyCounts.getOrDefault(county, 0) + 1);
		    }
		}

		
		// Convert to graph for byCounty
		// Convert to JSON (e.g., using Gson)
		Gson gson = new Gson();
		String countyLabelsJson = gson.toJson(new ArrayList<>(countyCounts.keySet()));
		String countyDataJson = gson.toJson(new ArrayList<>(countyCounts.values()));
		
		// Prepare combined graph
		// Map<String, Map<String, Long>> genderCountyData = new HashMap<>();
		Map<String, Map<String, Integer>> countyGenderMap = new HashMap<>();
		
		// Loop through each contact and accumulate data by gender and county
		for (Contact contact : allContacts) {
		    String gender = contact.getGender();  // Male, Female, Other
		    String county = contact.getCounty();  // County name, e.g., Nairobi, Mombasa

		    // Initialize the gender map if it doesn't exist
		    // genderCountyData.computeIfAbsent(gender, k -> new HashMap<>())
		       //     .merge(county, 1L, Long::sum);
		    
		    countyGenderMap
	        .computeIfAbsent(county, k -> new HashMap<>())
	        .merge(gender, 1, Integer::sum);
		}

		// Convert the map to JSON (using libraries like Jackson or Gson)
		// ObjectMapper objectMapper = new ObjectMapper();
		//String jsonData = objectMapper.writeValueAsString(genderCountyData);
		
		ObjectMapper mapper = new ObjectMapper();
		String chartDataJson = mapper.writeValueAsString(countyGenderMap);
		request.setAttribute("chartDataJson", chartDataJson);

		// Send jsonData to the frontend (via the request attributes, model, or AJAX response)
		// request.setAttribute("genderCountyData", jsonData);
		
		
		request.setAttribute("genderMale", genderCounts.get("Male"));
		request.setAttribute("genderFemale", genderCounts.get("Female"));
		request.setAttribute("genderOther", genderCounts.get("Other"));
		
		request.setAttribute("countyLabelsJson", countyLabelsJson);
		request.setAttribute("countyDataJson", countyDataJson);
		
		request.setAttribute("error", error);
		request.setAttribute("recentList", recentContactList);
		request.setAttribute("totalContacts", totalContacts);
		

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/INDEX.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
