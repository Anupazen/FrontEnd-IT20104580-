$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});


// SAVE ============================================
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
	//var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
		{
			url: "ProfileAPI",
			type: "PUT",
			data: $("#formProf").serialize(),
			dataType: "text",
			complete: function(response, status) {
				onItemSaveComplete(response.responseText, status);
			}
		});
});


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {
	//alert('Alert');
	$("#CusIDSave").val($(this).data("cusid"));
	//console.log($("#CusIDSave").val());
	$("#CusMail").val($(this).closest("tr").find('td:eq(2)').text());
	$("#pw").val($(this).closest("tr").find('td:eq(5)').text());
	//$("#itemPrice").val($(this).closest("tr").find('td:eq(2)').text());
	//$("#itemDesc").val($(this).closest("tr").find('td:eq(3)').text());
});

// CLIENT-MODEL================================================================
function validateItemForm() {
	// CODE
	if ($("#CusMail").val().trim() == "") {
		return "Insert An Email";
	}
	// NAME
	if ($("#pw").val().trim() == "") {
		return "Insert Password.";
	}
	
	return true;
}


function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.stringify(response);
		if (status == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet);
		} else if (status == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	} $("#CusIDSave").val("");
	$("#formProf")[0].reset();
}
