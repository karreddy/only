package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.RouteResult;
import helper.ConnectionProvider;

public class CitiesDao {

	public RouteResult getAllCities() {
		// TODO Auto-generated method stub
		RouteResult result = new RouteResult();

		try {
			Connection con = ConnectionProvider.createConnection();

			String q1 = "SELECT DISTINCT from_city from ticket_pricing";
			String q2 = "SELECT DISTINCT to_city from ticket_pricing";

			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();

			ResultSet rs1 = stmt1.executeQuery(q1);
			ResultSet rs2 = stmt2.executeQuery(q2);

			while (rs1.next()) {
				String city = rs1.getString("from_city");
				result.getFrom_cities().add(city);
			}

			while (rs2.next()) {
				String city = rs2.getString("to_city");
				result.getTo_cities().add(city);
			}

			stmt1.close();
			stmt2.close();
			rs1.close();
			rs2.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
