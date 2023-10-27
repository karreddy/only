
<%@ taglib prefix="c" uri="jakarta.tags.core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page</title>

<link rel="stylesheet" href="./resources/booking.css">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">



</head>
<body>
	<!-- Image and text -->



	<%@ include file="Navbar.jsp"%>




	<div class="container">

		<form action="BookingServlet" id="myForm" method="POST">
			<!-- Title for your form -->
			<h2 class="mb-4 text-center">Train Ticket Booking Form</h2>

			<!-- Success and Error Message -->
			<div id="successMessage" class="mt-3 font-weight-bold"
				style="display: none;">
				<div class="alert alert-success">Your Ticket is Booked</div>
			</div>
			<div id="errorMessage" class="mt-3 font-weight-bold"
				style="display: none;">
				<div class="alert alert-danger">Your Ticket Couldn't be
					booked. Please try again!</div>
			</div>

			<!-- First Name -->
			<div class="form-group">
				<label for="fname">First Name:</label> <input name="fname"
					type="text" class="form-control form-control-sm" id="fname"
					placeholder="Enter First Name" required>

			</div>

			<!-- Last Name -->

			<div class="form-group">
				<label for="lname">Last Name:</label> <input name="lname" type=text
					class="form-control form-control-sm" id="lname"
					placeholder="Enter Last Name" required>
			</div>

			<!-- Phone Number -->

			<div class="form-group">
				<label for="phone">Phone Number:</label> 
				
				<input name="phone"
					type="tel" class="form-control form-control-sm" id="phone"
					title="10 digit phone number" pattern="[0-9]{10}"
					placeholder="Enter Phone Number" required>
			</div>

			<!-- From Dropdown-->

			<div class="form-group">

				<label for="from">From:</label> <select
					class="form-control form-control-sm" name="from" id="from" required>
					<option value="">Please select an option</option>

					<c:forEach items="${result.getFrom_cities()}" var="from_city">

						<option value="${from_city}">${from_city}</option>
					</c:forEach>
				</select>

				<!-- To Dropdown -->

				<label for="to">To:</label> 
				<select
					class="form-control form-control-sm" name="to" id="to" required>

					<option value="">Please select an option</option>

					<c:forEach items="${result.getTo_cities()}" var="to_city">

						<option value="${to_city}">${to_city}</option>

					</c:forEach>
				</select>
			</div>

			<div class="row">
				<div class="col">
					<label for="from_date">From Date:</label> <input type="date"
						id="from_date" name="from_date" class="form-control"
						placeholder="Journey Start Date" required>
						
				</div>
				<div class="col">
					<label for="to_date">To Date:</label> <input type="date"
						id="to_date" name="to_date" class="form-control"
						placeholder="Journey End Date">
						
				</div>
				
				
			</div>
			
			<!-- Ticket Number -->
			<div class="form-group">
				<label for="pnr">PNR:</label> 
				<input name="pnr" class="form-control form-control-sm" id="pnr" type="number"
					readonly> <small class="text-danger font-weight-bold"
					id="pnr_msg"></small>

			</div>

			<!-- Amount -->
			<div class="form-group">
				<label for="amount">Amount:</label> <input name="amount"
					class="form-control form-control-sm" id="amount" type="number"
					readonly> <small class="text-danger font-weight-bold"
					id="msg"></small>
			</div>
			<button type="submit" id="btnSubmit"
				class="btn btn-tertiary text-center">Submit</button>

		</form>



	</div>

	<!-- Bootstrap -->

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- JQUERY -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>



	<script>
	
	<!-- PNR NUMBER GENERATOR -->
		
		function GetNewPnr() {
			$.ajax({
				url : "PnrServlet",
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					$('#pnr').val(data);	
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error....");
					$('#pnr_msg').html("Couldn't Generate PNR Number Something went Wrong");
				}
			});		
		}
		
		$(document).ready(function() {
			console.log("page ready");
			GetNewPnr();	
		});
		
		
		
		<!-- Handling the enable and disable of  -->

		$('#from,#to').on('change', function(event) {

			event.preventDefault();

			$('#msg').html("");
			$("#btnSubmit").removeAttr("disabled");

			var dataToSend = {
				to : $('#to').val(),
				from : $('#from').val()
			};
			
			console.log(dataToSend);
			if (dataToSend.from === '' && dataToSend.to === '') {
				$('#amount').val('');
				$("#btnSubmit").attr("disabled", false);
			}
			else if (dataToSend.from === dataToSend.to) {
				$('#msg').html("The departure location cannot be same as your destination");
				$('#amount').val('-1');
				$("#btnSubmit").attr("disabled", true);
			}
			else if(dataToSend.from === ''){
				$('#msg').html("Please select the departure location");
				$('#amount').val('-1');
				$("#btnSubmit").attr("disabled", true);
			}
			else if(dataToSend.to === '' ){
				$('#msg').html("Please select the destination location");
				$('#amount').val('-1');
				$("#btnSubmit").attr("disabled", true);
			}
			else{
				$.ajax({
					url : "AmountServlet",
					data : dataToSend,
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						if (data.trim() !== '-1') {
							$('#amount').val(data);

						} else {
							$('#amount').val(data);
							$('#msg').html("No trains on this route");
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error....");
						$('#msg').html("Something went wrong on server!");
					}
				});
			}
			
		});

		
		$('#myForm').on('submit', function(event) {
			event.preventDefault();

			$('#msg').html("");

			var dataToSend = {
					
				pnr : $('#pnr').val(),
				fname : $('#fname').val(),
				lname : $('#lname').val(),
				phone : $('#phone').val(),
				from : $('#from').val(),
				to : $('#to').val(),
				from_date : $('#from_date').val(),
				to_date : $('#to_date').val(),
				amount : $('#amount').val(),
			};
			
			console.log(dataToSend);
			if (dataToSend.from === dataToSend.to) {
				$('#successMessage').hide();
				$('#errorMessage').show();
			} else {
				$.ajax({
					url : "BookingServlet",
					data : dataToSend,
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						if (data.trim() !== 'success') {
							$('#successMessage').hide();
							$('#errorMessage').show();
							
							setTimeout(function () {
								$('#errorMessage').hide();
					        }, 1000);
							
						} else {
							<!-- Update Pnr when successful booking -->
							GetNewPnr();
							
							$('#successMessage').show();
							$('#errorMessage').hide();
							
							setTimeout(function () {
								$('#successMessage').hide();
					        }, 1000);

						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$('#successMessage').hide();
						$('#errorMessage').show();
						setTimeout(function () {
							$('#errorMessage').hide();
				        }, 1000);
					}
				});
			}
			
		});
	</script>
</body>
</html>