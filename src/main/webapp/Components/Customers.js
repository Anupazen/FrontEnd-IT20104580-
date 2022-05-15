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
			url: "CustomerAPI",//change this
			type: "GET",
			data: $("#formCustomer").serialize(),
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
	if ($("#AccNo").val().trim() == "") {
		return "Insert Account Number.";
	}
	// Month
	if ($("#Month").val().trim() == "") {
		return "Insert Month.";
	}
	// is numerical value
	var AccNo = $("#AccNo").val().trim();
	if (!$.isNumeric(AccNo)) {
		return "Insert a numerical value for Account Number.";
	}
	// is numerical value
	var month = $("#Month").val().trim();
	if (!$.isNumeric(month)) {
		return "Insert a numerical value for Month.";
	}
	// convert to decimal Account number
	$("#AccNo").val(parseFloat(AccNo).toFixed(2));
	
	// convert to decimal Month
	$("#Month").val(parseFloat(month).toFixed(2));
	return true;
}


function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully Retreived.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
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
	$("#formCustomer")[0].reset();
}
