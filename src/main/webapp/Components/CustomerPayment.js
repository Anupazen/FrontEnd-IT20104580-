$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});


$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	//var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";// change this
	$.ajax(
		{
			url: "PaymentAPI",//change this
			type: "POST",
			data: $("#formPay").serialize(),
			dataType: "text",
			complete: function(response, status){
				console.log(response.responseText);
				onItemSaveComplete(response.responseText, status);
			}
		});
});


// CLIENT-MODEL================================================================
function validateItemForm() {
	// Account Number
	if ($("#pay").val().trim() == "") {
		return "Insert Payment Method.";
	}
	// Month
	if ($("#bill").val().trim() == "") {
		return "Insert Bill Number.";
	}
	if ($("#cus").val().trim() == "") {
		return "Insert customer ID.";
	}
	if ($("#pw").val().trim() == "") {
		return "Insert Payment Password.";
	}
	return true;
}


function onItemSaveComplete(response, status) {
	console.log("insideeeeeeeeee3");
	if (status == "success") {
		var resultSet = JSON.stringify(response);
		console.log("inside");
		if (status == "success") {
			console.log("inner inside");
			$("#alertSuccess").text("Successfully Retreived.");
			console.log("i'm here'");
			$("#alertSuccess").show();
			$("#divGrid").html(resultSet);
		} else if (resultSet.status == "error") {
			console.log("inner outside");
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while Retreiving Data.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while Retreiving..");
		$("#alertError").show();
	} $("#hidItemIDSave").val("");
	$("#formPay")[0].reset();
}
