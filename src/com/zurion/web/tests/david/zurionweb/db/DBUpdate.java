package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.zurion.web.tests.david.zurionweb.model.*;

public class DBUpdate {

	public static void updateContact(Connection con, Contact c) throws SQLException {
		String query = "UPDATE contact SET CONTACT_ID=?, FULL_NAME=?, PHONE=?, EMAIL=?, COUNTY=?, ID_NUMBER=?, DATE_OF_BIRTH=?, GENDER=?, DATE_ADDED=?, COMMENTS=?, STATUS=? WHERE CONTACT_ID=?";

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
			pst.setInt(12, c.getContactId());
			pst.executeUpdate();
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
	}


	/** ******************************************************************************************************************************************
	 * 	DELETE A RESOURCE
	 * 	******************************************************************************************************************************************
	 */
	public static boolean deleteResource(Connection con, Entity e) throws SQLException {			
		String sql = "DELETE FROM " + e.getTableName() + " WHERE " + e.getColumn() + " = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql);){
			//pst.setString(1, e.getTableName());
			//pst.setString(2, e.getColumn());
			pst.setLong(1, e.getEntityID());	//Or just pass entityID
			
			//System.out.println(sql);			
			pst.executeUpdate();
			return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}}
