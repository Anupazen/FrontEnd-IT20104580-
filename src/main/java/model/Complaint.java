package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.sun.jersey.api.client.*;
import com.sun.jersey.api.client.WebResource;

public class Complaint {

	static String s=null;
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
	
	public String readComplaint(String cusid) {
		String output = "";
		s=cusid;
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Inquiry Message</th>" + "<th>Section</th>"
					+ "<th>Customer ID</th>" + "<th>Update</th></tr>";

			String query = "select * from complaint where Cus_id ="+cusid+"";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String complaint_id = Integer.toString(rs.getInt("complaint_id"));
				String Inquiry_message = rs.getString("Inquiry_message");
				String Section = rs.getString("Section");
				String Cus_id = rs.getString("Cus_id");
				// Add into the html table
				output += "<tr><td>" + Inquiry_message + "</td>";
				output += "<td>" + Section + "</td>";
				output += "<td>" + Cus_id + "</td>";
				// buttons
				output += "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-comid='"
						+ complaint_id + "'>" + "</td></tr>";
				
				
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String makeComplaint(String Inquiry_message, String Section, String Cus_id) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for payment";
			}
			// create a prepared statement
			String query = " insert into complaint (`Complaint_id`,`Inquiry_message`,`Section`,`Cus_id`)"
					+ " values (?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, Inquiry_message);
			preparedStmt.setString(3, Section);
			preparedStmt.setString(4, Cus_id);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Complaint Successfully Sent";
			
			String newItems = readComplaint(Cus_id);
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while making Complaints.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deleteComplaint(String Complaint_id) {
		String output = "";
		int comid=Integer.parseInt(Complaint_id);
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from complaint where Complaint_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, comid);
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = readComplaint(s);
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting Complaints.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

}
