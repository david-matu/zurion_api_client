package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.zurion.web.tests.david.zurionweb.model.*;

public class DBCreate {

	public static void createContact(Connection con, Contact c) throws SQLException {
		String query = "INSERT INTO contact(CONTACT_ID, FULL_NAME, PHONE, EMAIL, COUNTY, ID_NUMBER, DATE_OF_BIRTH, GENDER, DATE_ADDED, COMMENTS, STATUS )"
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

		try (PreparedStatement pst = con.prepareStatement(query);) {
			pst.setInt(1, c.getContactId());
			pst.setString(2, c.getFullName());
			pst.setString(3, c.getPhone());
			pst.setString(4, c.getEmail());
			pst.setString(5, c.getCounty());
			pst.setInt(6, c.getIdNumber());
			pst.setDate(7, c.getDateOfBirth());
			pst.setString(8, c.getGender());
			pst.setTimestamp(9, c.getDateAdded());
			pst.setString(10, c.getComments());
			pst.setString(11, c.getStatus());
			pst.executeUpdate();
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
	}

}
