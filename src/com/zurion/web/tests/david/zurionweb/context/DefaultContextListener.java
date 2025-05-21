package com.zurion.web.tests.david.zurionweb.context;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.zurion.web.tests.david.zurionweb.db.DBConnection;


@WebListener
public class DefaultContextListener implements ServletContextListener {
	
	static final Logger LOGGER = Logger.getLogger(DefaultContextListener.class); 
	
    public void contextInitialized(ServletContextEvent event) {    	
    	ServletContext ctx = event.getServletContext();
    	
    	ctx.setAttribute("assets", ctx.getContextPath() + "/assets");
    	
    	// initialize log4j here
        ServletContext context = event.getServletContext();
        String log4jConfigFile = context.getInitParameter("log4j-config-location");
        String fullPath = context.getRealPath("") + File.separator + log4jConfigFile;
        
        //Fetch Properties from File
        Properties props = new Properties();
        
        String appPropertiesFile = context.getInitParameter("app-properties");
        String propsPath = context.getRealPath("") + File.separator + appPropertiesFile;
		
        File propsFile = new File(propsPath);
        
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(propsFile);
			props.load(fis);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        
		String assetsDNS = props.getProperty("ASSETS_DNS");
		ctx.setAttribute("assetsDNS", assetsDNS);

        System.out.println("Initilizing Database Parameters\n" + new Date(System.currentTimeMillis()));
        DBConnection.intializeDBParameter(props);
        
        System.out.println("Serving static resources with the following URL: \n" + ctx.getAttribute("assets"));//"http://yourdns.domain/assets" );
        
        PropertyConfigurator.configure(fullPath);        
        LOGGER.info("Log4j Initialized and Application started");
    }

	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		//do cleanup if needed
	}
	
}

