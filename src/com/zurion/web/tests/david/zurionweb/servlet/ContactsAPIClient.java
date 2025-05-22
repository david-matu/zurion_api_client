package com.zurion.web.tests.david.zurionweb.servlet;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.zurion.web.tests.david.zurionweb.model.AdvancedContact;
import com.zurion.web.tests.david.zurionweb.model.SearchTerm;
import com.zurion.web.tests.david.zurionweb.util.SqlDateAdapter;
import com.zurion.web.tests.david.zurionweb.util.SqlTimestampAdapter;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@WebServlet(
		asyncSupported = true, 
		description = "Consume APIs from the other end to deliver search and listing", 
		urlPatterns = { "/search"})
public class ContactsAPIClient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OkHttpClient client = new OkHttpClient();
	
	private static final Gson gson = new GsonBuilder()
		    .registerTypeAdapter(java.sql.Timestamp.class, new SqlTimestampAdapter())
		    .create();
	
	private static ObjectMapper obm = new ObjectMapper();
	
	// private static final Gson gsonPlain = new Gson();
	
	public ContactsAPIClient() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_ADD.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchTerm = request.getParameter("searchTerm");
		
		SearchTerm st = new SearchTerm();
		st.setSearchType(searchType);
		st.setSearchTerm(searchTerm);
		
		
		RequestBody body = RequestBody.create(gson.toJson(st), MediaType.get("application/json; charset=utf-8"));
		
		Request apiRequest = new Request.Builder()
                .url("http://localhost:8080/zurionweb/api/contact/search")
                .post(body)
                .addHeader("Content-Type", "application/json")
                .build();
		
		System.out.println("API search request: " + apiRequest.toString());
		
        try (Response apiResponse = client.newCall(apiRequest).execute()) {
            if (apiResponse.isSuccessful()) {
                String responseBody = apiResponse.body().string();
                System.out.println("Response:\n" + responseBody);
                
                if(searchType.equalsIgnoreCase("company")) {
                	Type listType = new TypeToken<List<AdvancedContact>>(){}.getType();
                	List<AdvancedContact> contacts = gson.fromJson(responseBody, listType);
                	
                	request.setAttribute("SearchResultType", "company \"" + searchTerm + "\"");
                	request.setAttribute("aList", contacts);
                	
            		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/SEARCH_RESULTS.jsp");
            		dispatcher.forward(request, response);
                } else if(searchType.equalsIgnoreCase("individual")) {
                	request.setAttribute("SearchResultType", "individual");
                	
                	AdvancedContact c = gson.fromJson(responseBody, AdvancedContact.class);
                	System.out.println("Converted contact: " + c.toString());
                	
                	request.setAttribute("AdvancedContact", c); //obm.convertValue(responseBody, AdvancedContact.class));

            		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/SEARCH_RESULTS.jsp");
            		dispatcher.forward(request, response);
                }
                
            } else {
                System.err.println("Error: " + apiResponse.code() + " - " + apiResponse.message());
                
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/SEARCH_RESULTS.jsp");
        		dispatcher.forward(request, response);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}

