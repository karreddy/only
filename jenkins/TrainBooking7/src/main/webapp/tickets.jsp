<%@page import="entity.Booking"%>
<%@page import="java.util.List"%>
<%@page import="dao.TicketsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sql" uri="jakarta.tags.sql"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>


<%
List<Booking> bookings;
TicketsDao td = new TicketsDao();
bookings = td.getAllTickets();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- don't give type -->

<link rel="stylesheet" href="./resources/tickets.css">

<!-- Bootstrap css -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>

<!-- datatables css-->

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />

<!-- export feature css-->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css" />

<!-- datatables js -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

<!-- export feature js-->

<script
	src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script
	src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>


<!-- Bootstrap js not included because of conflict btwn bootstrap and jquery datatables-->

<style>
.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
  background: #017bfe;
  color: white!important;
  border: none;
  /* border-radius: 4px; */
  /* border: 1px solid #828282; */
}
 
.dataTables_wrapper .dataTables_paginate .paginate_button:active {
  background: none;
  color: #017bfe!important;
}

/* Working for all except when disabled */
.dataTables_wrapper .dataTables_paginate .paginate_button{
  color: #017bfe!important;

}
/* Working for  disabled */
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled{
  color: #017bfe!important;

}

.dataTables_wrapper .dataTables_paginate .paginate_button.current{
 	border:none;
 	color: white !important;
	background: #017bfe;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover{
 	border:none;
 	color: white !important;
	background: #017bfe;
}
/* div.dt-buttons>.dt-button{
	background: #017bfe !important;
	color: white;
	border:none;
}
div.dt-buttons>.dt-button:hover:not(.disabled){
	color: white !important;
	background: #017bfe !important;
	border:none;
} */
</style>


</head>
<body>
	<%@ include file="Navbar.jsp"%>

	<div class="card">
		<div class="card-header text-center font-weight-bold">Tickets
			List</div>
		<div class="card-body">
			<table id="myTable" class="table table-striped table-bordered mb-2">
				<thead class="font-weight-bold">
					<tr>
						<td>Id</td>
						<td>PNR No.</td>
						<td>First Name</td>
						<td>Last Name</td>
						<td>Phone</td>
						<td>From</td>
						<td>To</td>
						<td>Booking Date</td>
						<td>From Date</td>
						<td>To Date</td>
						<td>Amount</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="<%=bookings%>" var="booking">
						<tr>
							<td>${booking.getId()}</td>
							<td>${booking.getPnr()}</td>
							<td>${booking.getFname()}</td>
							<td>${booking.getLname()}</td>
							<td>${booking.getPhone()}</td>
							<td>${booking.getFrom()}</td>
							<td>${booking.getTo()}</td>
							<td>${booking.getBooking_date()}</td>
							<td>${booking.getTo_date()}</td>
							<td>${booking.getFrom_date()}</td>
							<td>${booking.getAmount()}</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>





			<script>
				$(document).ready(function() {
					$('#myTable').DataTable({
						order: [],
						dom : 'Bfrtipl',
						"bInfo" : false,
					    buttons: [
					    	 	{
					                extend: 'copy',
					                title: 'Tickets List'
					            },
					            {
					                extend: 'excel',
					                title: 'Tickets List'
					            },
					            {
					                extend: 'csv',
					                title: 'Tickets List'
					            },
					            {
					                extend: 'pdf',
					                title: 'Tickets List'
					            },
					            {
					                extend: 'print',
					                title: 'Tickets List'
					            }
					            
					        ]
					    });
				});
				
				
			</script>
			
		</div>
	</div>
</body>
</html>