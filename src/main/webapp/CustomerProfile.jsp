<%@page import="model.Profile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Profile.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Profile</h1>
				<form id="formProf" name="formProf">
					Email: <input id="CusMail" name="CusMail" type="text" class="form-control form-control-sm"> <br> 
					Password: <input id="pw" name="pw" type="password" class="form-control form-control-sm"> <br> 
				    <input type="hidden" id="CusIDSave" name="CusIDSave" value="">
				    <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
					Profile itemObj = new Profile();
					out.print(itemObj.readProfile());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>