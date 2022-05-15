package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Payment {

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
	
	public String readPayment(String cusid) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Payment Method</th> <th>Bill ID</th><th>Customer ID</th>"
					+ "</tr>";
			String query = "select * from Payment where Cus_id = "+cusid+"";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String method = rs.getString("Payment_method");
				String billID = rs.getString("Bill_id");
				String customer = rs.getString("Cus_id");
				String id=Integer.toString(rs.getInt("Payment_id"));
				// Add into the html table
				output += "<tr><td>" + method + "</td>";
				output += "<td>" + billID + "</td>";
				output += "<td>" + customer + "</td>";
				// buttons
				
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
	
	public String makePayment(String payment_method, String Bill_id, String Cus_id, String PayPw) {
		String output = "";
		boolean istrue=false;
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for payment";
			}
			// create a prepared statement
			
			String query = "select Cus_id, Pw from authentication";  
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
						
			while(rs.next())
			{
				String cusid = rs.getString("Cus_id");
				String password = rs.getString("Pw");
			
							
				if(Cus_id.equals(cusid) && PayPw.equals(password))
				{
					istrue=true;
				
				}	
			}
			
			if(istrue==true)
			{
			String query2 = " insert into payment (`Payment_id`,`Payment_method`,`Bill_id`,`Cus_id`)"
					+ " values (?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query2);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, payment_method);
			preparedStmt.setString(3, Bill_id);
			preparedStmt.setString(4, Cus_id);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Payment Successful";
			String newItems = readPayment(Cus_id);
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
			}
			else {
				output = "Payment Authentiction failed";
			}		
			
		} catch (Exception e) {
			output = "Error while inserting to the payment table";
			System.err.println("Error while inserting to the payment table");
		}
		return output;
	}
}
