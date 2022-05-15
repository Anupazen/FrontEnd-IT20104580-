package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class Bill {

	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3308/electrogrid_customer", "root", ""); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	public String readBill(String Acno,String mon) {
		String output = "";
		double amount=0;
		double Accno2=Double.parseDouble(Acno);
		double month2=Double.parseDouble(mon);
		
		int Accno=(int) Accno2;
		int month=(int) month2;
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Bill ID</th><th>Month</th>" + "<th>Unit Rate</th>"
					+ "<th>Units Used</th>" + "<th>Amount</th><th>Account Number</th></tr>";

			String query = "select * from bill where Account_number="+Accno+" and month="+month+"";			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
					
					// iterate through the rows in the result set
			while (rs.next()) {
				amount=rs.getInt("used_units") * rs.getDouble("Unit_rate");
				String Amount = Double.toString(amount);
				
				String BillID = rs.getString("Bill_id");
				String Month = Integer.toString(rs.getInt("Month"));
				String UnitRate = Double.toString(rs.getDouble("Unit_rate"));
				String usedUnits = Integer.toString(rs.getInt("used_units"));
				String Account = Integer.toString(rs.getInt("Account_number"));
				
				// Add into the html table
				output += "<tr><td>" + BillID + "</td>";
				output += "<td>" + Month + "</td>";
				output += "<td>" + UnitRate + "</td>";
				output += "<td>" + usedUnits + "</td>";
				output += "<td>" + Amount + "</td>";
				output += "<td>" + Account + "</td>";
				// buttons
				output += "</tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
			
			
		} catch (Exception e) {
			output = "err";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	
//	public String readAllBill(int accountNumber) {
//		Client c = Client.create();
//		WebResource resource =
//		c.resource("/////////////////////////////////////////////////////////////////////");
//		String output = resource.get(String.class);
//		return "From server-service: " + output;
//	}

}
