package com.zurion.web.tests.david.zurionweb.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class DBConnection {
	private static DataSource ds;
	
	static String DB_DRIVER = "com.mysql.cj.jdbc.Driver";	//Default Driver
	static String URL = "jdbc:mysql://localhost:3307/zuriondb?verifyServerCertificate=false&useSSL=true&requireSSL=true";
	static String DB_USER = "root";
	static String DB_PASSWORD = "root";

	public static DataSource getDataSource() {
		if(ds == null) {
			HikariConfig config = new HikariConfig();
			config.setDriverClassName(DB_DRIVER);
			config.setJdbcUrl(URL);
			config.setUsername(DB_USER);
			config.setPassword(DB_PASSWORD);
			
			config.setMaximumPoolSize(30);
			config.setAutoCommit(true);
			config.setConnectionTimeout(7000);
			config.addDataSourceProperty("cachePrepStmts", "true");
			config.addDataSourceProperty("prepStmtCacheSize", "250");
			config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
			config.addDataSourceProperty("tcpKeepAlive", true);
			
			config.addDataSourceProperty("sslMode", "DISABLED");
			config.addDataSourceProperty("allowPublicKeyRetrieval", "false");
			
			ds = new HikariDataSource(config);
		}
		return ds;
	}

	public DBConnection() {
		ds = getDataSource();
	}

	public static Connection createConnection() {
		Connection con = null;
		try {
			if(ds != null) {
				con = ds.getConnection();
			} else {
				con = getDataSource().getConnection();
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
		if(con == null) {
			System.out.println("Critical Datasource search! Cannot contact the database");
			try {
				con = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return con;
	}

	public static void closeConnection(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
	
	/**
	 * Will parse properties to get database information
	 * @return sql connection
	 */
	public static void intializeDBParameter() {		
		Properties props = new Properties();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream("app.properties");
			props.load(fis);
			
			DB_DRIVER = props.getProperty("DB_DRIVER");
			URL = props.getProperty("DB_URL");
			DB_USER = props.getProperty("DB_USER");
			DB_PASSWORD = props.getProperty("DB_PASSWORD");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//Register the Driver
		try {
			Class.forName(DB_DRIVER);
		} catch(ClassNotFoundException ex) {
		   System.out.println("Error: unable to load driver class!");		 
		}
		
		//Get the connection
		Connection con = null;
        try {
			con = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        System.out.println("Testing Database Connectivity @" + new Date(System.currentTimeMillis()));
        
        String query = "SELECT 1";		
		try (PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();) {
			
			if(rs.next()) {
				System.out.println(":::::::::::::::::SUCCESSFULLY INITIALIZED TO LIVE DB::::::::::::::::::");
			}
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Failed to Initialize Database. The parameters in app.properties file are probably incorrect, "
					+ "or there's no appropriate driver for your target database. "
					+ "\nIf latter case, try dropping the driver (*.jar) file into this applications lib folder: /WEB-INF/lib \n");
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("End of Testing Database Connectivity @" + new Date(System.currentTimeMillis()));
	}

	public static void intializeDBParameter(Properties props) {		
		DB_DRIVER = props.getProperty("DB_DRIVER_CLASS");
		URL = props.getProperty("DB_URL");
		DB_USER = props.getProperty("DB_USER");
		DB_PASSWORD = props.getProperty("DB_PASSWORD");
		
		System.out.println("DB_DRIVER: " + props.getProperty("DB_DRIVER_CLASS"));
		System.out.println("DB_URL: " + props.getProperty("DB_URL"));
		System.out.println("DB_USER: " + props.getProperty("DB_USER"));
		System.out.println("DB_PASSWORD: " + props.getProperty("DB_PASSWORD"));
		
		
		//Register the Driver
		try {
			Class.forName(DB_DRIVER);
		} catch(ClassNotFoundException ex) {
		   System.out.println("Error: unable to load driver class!");		 
		}
		
		//Get the connection
		Connection con = null;
        try {
			con = DriverManager.getConnection(props.getProperty("DB_URL"), props.getProperty("DB_USER"), props.getProperty("DB_PASSWORD"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        System.out.println("Testing Database Connectivity @" + new Date(System.currentTimeMillis()));
        
        String query = "SELECT 1";		
		try (PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();) {
			
			if(rs.next()) {
				System.out.println(":::::::::::::::::SUCCESSFULLY INITIALIZED TO LIVE DB::::::::::::::::::");
			}
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Failed to Initialize Database. The parameters in app.properties file are probably incorrect, "
					+ "or there's no appropriate driver for your target database. "
					+ "\nIf latter case, try dropping the driver (*.jar) file into this application's lib folder: /WEB-INF/lib \n");
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("End of Testing Database Connectivity @" + new Date(System.currentTimeMillis()));
	}	
	public static String getURL() {
		return URL;
	}

	public static void setURL(String uRL) {
		URL = uRL;
	}

	public static String getDB_USER() {
		return DB_USER;
	}

	public static void setDB_USER(String dB_USER) {
		DB_USER = dB_USER;
	}

	public static String getDB_PASSWORD() {
		return DB_PASSWORD;
	}

	public static void setDB_PASSWORD(String dB_PASSWORD) {
		DB_PASSWORD = dB_PASSWORD;
	}
	
}
