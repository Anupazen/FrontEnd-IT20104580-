package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Profile {

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
	
	public String readProfile() {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Name</th> <th>NIC</th><th>Email</th>"
					+ "<th>Phone</th> <th>Location</th><th>Password</th><th>Age</th><th>Update</th></tr>";
			String query = "select * from Customer where Cus_id = "+2+"";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String Cus_id = rs.getString("Cus_id");
				String name = rs.getString("name");
				String NIC = rs.getString("NIC");
				String Email = rs.getString("Email");
				String Phone = Long.toString(rs.getLong("Phone"));
				String Location = rs.getString("Location");
				String Password = rs.getString("Password");
				String age=Integer.toString(rs.getInt("age"));
				
				// Add into the html table
				output += "<tr><td><input id='hidProfIDUpdate' name='hidProfIDUpdate' type='hidden' value='" 
						+ Cus_id
						+ "'>" + name + "</td>";
				output += "<td>" + NIC + "</td>";
				output += "<td>" + Email + "</td>";
				output += "<td>" + Phone + "</td>";
				output += "<td>" + Location + "</td>";
				output += "<td>" + Password + "</td>";
				output += "<td>" + age + "</td>";
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary' data-cusid='"+Cus_id+"'></td>"
						+ "</tr>";
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

	public String updateProfile(String Cus_id, String Email, String Password) {

		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE Customer SET Email=?,Password=? WHERE Cus_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			
			preparedStmt.setString(1, Email);
			preparedStmt.setString(2, Password);
			preparedStmt.setString(3, Cus_id);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";
			String newItems = readProfile();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "Error while updating the Customer";
			System.err.println(e.getMessage());
		}
		return output;
	}
}
