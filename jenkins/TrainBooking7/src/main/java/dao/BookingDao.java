package dao;

import java.sql.Connection;
import entity.Booking;
import helper.ConnectionProvider;
import java.sql.PreparedStatement;

public class BookingDao {

	public boolean addBooking(Booking b) {
		boolean f = false;
		try {
			Connection con = ConnectionProvider.createConnection();

			String q = "INSERT INTO booking(pnr, fname, lname, phone, from_city, to_city, booking_date, from_date, to_date, amount) values (?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, b.getPnr());
			pstmt.setString(2, b.getFname());
			pstmt.setString(3, b.getLname());
			pstmt.setString(4, b.getPhone());
			pstmt.setString(5, b.getFrom());
			pstmt.setString(6, b.getTo());
			pstmt.setDate(7, b.getBooking_date());
			pstmt.setString(8, b.getFrom_date());
			pstmt.setString(9, b.getTo_date());
			pstmt.setInt(10, b.getAmount());

			int RowsAffected = pstmt.executeUpdate();
			if (RowsAffected > 0) {
				f = true;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
