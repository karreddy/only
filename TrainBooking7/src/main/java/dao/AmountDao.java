package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import helper.ConnectionProvider;

public class AmountDao {

	public int getAmount(String from, String to) {

		int amount = -1;
		try {

			Connection con = ConnectionProvider.createConnection();

			String q = "select amount from ticket_pricing where from_city=? and to_city=?";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setString(1, from);
			pstmt.setString(2, to);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				amount = rs.getInt("amount");
			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}
}
