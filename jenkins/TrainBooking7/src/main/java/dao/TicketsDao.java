package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Booking;
import helper.ConnectionProvider;

public class TicketsDao {

	public List<Booking> getAllTickets()
	{
		List<Booking> bookings =new ArrayList<Booking>();
		
		try {
			String q="select * from booking ORDER BY booking_date DESC";
			Connection con =ConnectionProvider.createConnection();
			Statement stmt=con.createStatement();
			ResultSet rs= stmt.executeQuery(q);
			
			while(rs.next()) {
				Booking b=new Booking();
				b.setId(rs.getInt("booking_id"));
				b.setPnr(rs.getString("pnr"));
				b.setFname(rs.getString("fname"));
				b.setLname(rs.getString("lname"));
				b.setPhone(rs.getString("phone"));
				b.setFrom(rs.getString("from_city"));
				b.setTo(rs.getString("to_city"));
				b.setBooking_date(rs.getDate("booking_date"));
				b.setFrom_date(rs.getString("from_date"));
				b.setTo_date(rs.getString("to_date"));
				b.setAmount(rs.getInt("amount"));
				bookings.add(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bookings;

	}
}
