package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zurion.web.tests.david.zurionweb.model.*;

public class FindUtils {

	public static boolean isUniqueContactId(Connection con, int uNumber) throws SQLException {
		String sql = "SELECT CONTACT_ID FROM contact WHERE CONTACT_ID=?";
		
		boolean unique = true;
		
		try (PreparedStatement pst = con.prepareStatement(sql);){
			pst.setInt(1, uNumber);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				unique = false;
				return unique;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return unique;
	}


	public static boolean isValidLogin(Connection con, String userID, String password) {
		String sql = "SELECT USER_ID FROM USER WHERE (PHONE=? OR EMAIL=?) AND SECRET=?";
		
		try (PreparedStatement pst = con.prepareStatement(sql);){
			pst.setString(1, userID);
			pst.setString(2, userID);
			pst.setString(3, password);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
