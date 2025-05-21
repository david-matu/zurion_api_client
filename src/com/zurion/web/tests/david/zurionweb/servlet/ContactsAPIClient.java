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

	
	public ContactsAPIClient() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin/CONTACT_ADD.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchCriteria = request.getParameter("searchTerm");
		
        String json = "{ \"name\": \"David\" }"; // your request payload
		
		RequestBody body = RequestBody.create(
	            json, MediaType.get("application/json; charset=utf-8")
	        );
		
		Request apiRequest = new Request.Builder()
                .url("http://localhost:8080/zurionwebapi/api/contact")
                .post(body)
                .addHeader("Content-Type", "application/json") // or application/soap+xml
                .build();

        try (Response apiResponse = client.newCall(apiRequest).execute()) {
            if (apiResponse.isSuccessful()) {
                String responseBody = apiResponse.body().string();
                System.out.println("Response:\n" + responseBody);
            } else {
                System.err.println("Error: " + apiResponse.code() + " - " + apiResponse.message());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}

