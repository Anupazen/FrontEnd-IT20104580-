<%@page import="model.Bill"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Customers.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Customer Portal</h1>

				<form id="formCustomer" name="formCustomer">
					Account Number: <input id="AccNo" name="AccNo" type="text" class="form-control form-control-sm"> <br>
					Month: <input id="Month" name="Month" type="text" class="form-control form-control-sm"> <br> 
						 
						 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
						 <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				</form><br>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
						String AccNo="0",Month="0";
						Bill billObj = new Bill();
						out.print(billObj.readBill(AccNo,Month));
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>