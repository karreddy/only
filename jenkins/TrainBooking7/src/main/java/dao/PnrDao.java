package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import helper.ConnectionProvider;

public class PnrDao {

	public boolean checkIfExists(String pnr) {
		// TODO Auto-generated method stub
		Connection con=ConnectionProvider.createConnection();
		System.out.println("PNR DAO");
		String q="select count(*) AS row_count from booking where pnr=?";
		boolean bool=false;
		int row_count=1;
		
		try {
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, pnr);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				row_count=rs.getInt("row_count");
			}
			if(row_count>0)
			{
				bool=true;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bool;
		
	}
}
