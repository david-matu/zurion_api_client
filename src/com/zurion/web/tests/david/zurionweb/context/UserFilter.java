package com.zurion.web.tests.david.zurionweb.context;

/**
 * 
 * @author David Matu (davidmatu817@gmail.com)
 *	Date: June 11, 2021
 *	Generated on : May 2, 2025, 7:01:37 PM
 */

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zurion.web.tests.david.zurionweb.model.User;


@WebFilter(filterName = "UserFilter", urlPatterns = { "/sudo/*" })
public class UserFilter implements Filter {

    public UserFilter() {
    }

	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String requestPath = req.getServletPath();
		request.setAttribute("nextURL", requestPath);
		
		User user = SessionManager.getLoggedUser(req.getSession());
		
		if(user != null) {
			chain.doFilter(request, response);
		} else {
			res.sendRedirect(req.getContextPath() + "/login");
		}	
	}

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	
}

