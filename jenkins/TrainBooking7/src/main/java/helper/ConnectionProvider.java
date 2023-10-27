package helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	static Connection con;

	public static Connection createConnection() {
		try {
				//Load Driver
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				// Create Connection
				String url = "jdbc:mysql://localhost:3306/railway";
				String user = "root";
				String password = "Akmrz@123";
				
				con = DriverManager.getConnection(url, user, password);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
