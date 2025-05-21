package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class StampUtils {

	public static String getResourceID(HttpServletRequest request) {		
		String assetID = request.getPathInfo().replace("/", "");
		
		return assetID;
	}

	public static int generateUniqueContactId(Connection con) {		
		String raw = "1234567890";
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		
		while(sb.length() < 9) {	//9 digits
			int index = (int) (random.nextFloat() * raw.length());
			sb.append(raw.charAt(index));
		}
		
		//Ensure that this id does not match any other number in the database table
		int uNumber = Integer.parseInt(sb.toString());
		boolean unique = true;
		try {
			unique = FindUtils.isUniqueContactId(con, uNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		//Recursive call to re-generate the code for a unique one
		if(unique == false) {
			generateUniqueContactId(con);
		}	
		//else return our already unique code
		return Integer.parseInt(sb.toString());
	}

}
