package com.zurion.web.tests.david.zurionweb.context;

import javax.servlet.http.HttpSession;

import com.zurion.web.tests.david.zurionweb.model.User;
import com.zurion.web.tests.david.zurionweb.model.User;

/**
 * 
 * 	@author David
 *	Dated: Sep 7, 2022
 */
public class SessionManager {
	
	public static void storeLoggedUser(HttpSession session, User user) {
		session.setAttribute("user", user);
	}

	public static User getLoggedUser(HttpSession session) {
		User signedUser = (User) session.getAttribute("user");
		   return signedUser;
	}
}

