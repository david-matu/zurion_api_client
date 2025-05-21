package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zurion.web.tests.david.zurionweb.model.*;

public class DBRead {

	public static Contact getContact(Connection con, int id) throws SQLException {
		String query = "SELECT * FROM contact WHERE CONTACT_ID = ?";
		try (PreparedStatement pst = con.prepareStatement(query);) {
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				Contact c = new Contact();
				c.setContactId(rs.getInt("CONTACT_ID"));
				c.setFullName(rs.getString("FULL_NAME"));
				c.setPhone(rs.getString("PHONE"));
				c.setEmail(rs.getString("EMAIL"));
				c.setCounty(rs.getString("COUNTY"));
				c.setIdNumber(rs.getInt("ID_NUMBER"));
				c.setDateOfBirth(rs.getDate("DATE_OF_BIRTH"));
				c.setGender(rs.getString("GENDER"));
				c.setDateAdded(rs.getTimestamp("DATE_ADDED"));
				c.setComments(rs.getString("COMMENTS"));
				c.setStatus(rs.getString("STATUS"));
				return c;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<Contact> getContactList(Connection con) throws SQLException {
		String query = "SELECT * FROM contact";
		List<Contact> cList = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();) {
			while(rs.next()) {
				Contact c = new Contact();
				c.setContactId(rs.getInt("CONTACT_ID"));
				c.setFullName(rs.getString("FULL_NAME"));
				c.setPhone(rs.getString("PHONE"));
				c.setEmail(rs.getString("EMAIL"));
				c.setCounty(rs.getString("COUNTY"));
				c.setIdNumber(rs.getInt("ID_NUMBER"));
				c.setDateOfBirth(rs.getDate("DATE_OF_BIRTH"));
				c.setGender(rs.getString("GENDER"));
				c.setDateAdded(rs.getTimestamp("DATE_ADDED"));
				c.setComments(rs.getString("COMMENTS"));
				c.setStatus(rs.getString("STATUS"));

				cList.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	
	/**
	 * Get 5 the most recently added contacts
	 * 
	 */
	public static List<Contact> getRecent5ContactList(Connection con) throws SQLException {
		String query = "SELECT * FROM contact ORDER BY DATE_ADDED DESC LIMIT 5";
		List<Contact> cList = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();) {
			while(rs.next()) {
				Contact c = new Contact();
				c.setContactId(rs.getInt("CONTACT_ID"));
				c.setFullName(rs.getString("FULL_NAME"));
				c.setPhone(rs.getString("PHONE"));
				c.setEmail(rs.getString("EMAIL"));
				c.setCounty(rs.getString("COUNTY"));
				c.setIdNumber(rs.getInt("ID_NUMBER"));
				c.setDateOfBirth(rs.getDate("DATE_OF_BIRTH"));
				c.setGender(rs.getString("GENDER"));
				c.setDateAdded(rs.getTimestamp("DATE_ADDED"));
				c.setComments(rs.getString("COMMENTS"));
				c.setStatus(rs.getString("STATUS"));

				cList.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}
	
}
