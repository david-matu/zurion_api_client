package com.zurion.web.tests.david.zurionweb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zurion.web.tests.david.zurionweb.model.*;

public class DBCounter {

	public static int countContact(Connection con, int contactId) throws SQLException {
		String query = "SELECT COUNT(*) FROM contact WHERE CONTACT_ID = ?";
		
		int result = 0;

		try (PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, contactId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
