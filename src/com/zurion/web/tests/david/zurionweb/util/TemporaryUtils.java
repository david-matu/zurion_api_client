package com.zurion.web.tests.david.zurionweb.util;

import com.zurion.web.tests.david.zurionweb.model.User;

public class TemporaryUtils {
	
	public TemporaryUtils() {
		super();
	}
	
	public static User getUser() {
		User user = new User();
		user.setUsername("admin");
		user.setPassword("admin@zurion");
		user.setEmail("jobs@zuriontech.com");
		user.setRole("ROLE_ADMIN");
		
		return user;
	}
	
	/**
	 * This is dummy, ideally, users should be managed from db
	 * @param username
	 * @param password
	 * @return
	 */
	public static User getUserByCredentials(String username, String password) {
		if(username.equals("admin") && password.equals("admin@zurion")) {
			System.out.println("Comparing login credentials for user: " + username + " / " + password);
			User user = new User();
			user.setUsername("admin");
			user.setPassword("admin@zurion");
			user.setEmail("jobs@zuriontech.com");
			user.setRole("ROLE_ADMIN");
			
			return user;
		}
		
		return null;
	}
}
