<%@page import="model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/CustomerPayment.js"></script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payment Portal</h1>

				<form id="formPay" name="formPay">
					Pay Method: <input id="pay" name="pay" type="text" class="form-control form-control-sm"> <br>
					Bill Number: <input id="bill" name="bill" type="text" class="form-control form-control-sm"> <br> 
					Customer Id: <input id="cus" name="cus" type="text" class="form-control form-control-sm"> <br> 
					Payment Password: <input id="pw" name="pw" type="password" class="form-control form-control-sm"> <br> 
					 
						 <input id="btnSave" name="btnSave" type="button" value="Pay" class="btn btn-primary"> 
				</form><br>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divGrid">
					<%
						String Cus="1";
						Payment pay=new Payment();
						out.print(pay.readPayment(Cus));
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>