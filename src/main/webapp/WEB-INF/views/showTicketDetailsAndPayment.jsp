<%@page import="model.LogInUser"%>
<%@page import="util.TrainSheduleUtil"%>
<%@page import="util.TrainUtil"%>
<%@page import="model.TicketDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Details</title>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />

<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MDB CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css"
	rel="stylesheet">
	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Popper.js (required for Bootstrap) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<!-- Internal CSS -->
<style>
/* Custom CSS */
body {
	background-image:
		url('https://seatreservation.railway.gov.lk/mtktwebslr/gallery/gallery-2.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	opacity: 0.9; /* Adjust the opacity as needed */
}

.ticket-details-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	margin: 20px auto;
	max-width: 600px;
}

.ticket-details-heading {
	font-size: 24px;
	font-weight: bold;
}

.ticket-details-label {
	font-weight: bold;
}

.container {
	margin-top: 50px;
}

.card {
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.card-title {
	font-size: 24px;
	font-weight: bold;
}

.form-group {
	margin-bottom: 20px;
}

#card-element {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#card-errors {
	color: #dc3545;
	margin-top: 5px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="#"> <img
					src="image\Sri_Lanka_Railway_logo.png" height="50"
					alt="railway Logo" loading="lazy" /> <img
					src="image\Sri_Lanka_Railway.jpg" height="45" alt="railway Logo"
					loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a>
					</li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="d-flex align-items-center">


				<!-- Notifications -->
				<div class="dropdown">
					<a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <i
						class="fas fa-bell"></i> <span
						class="badge rounded-pill badge-notification bg-danger">1</span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="News.jsp">Some news</a></li>
						<li><a class="dropdown-item" href="#">Another news</a></li>
						</li>
					</ul>
				</div>
				<!-- Avatar -->
				<div class="dropdown">
					<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
						href="#" id="navbarDropdownMenuAvatar" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <img
						src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
						class="rounded-circle" height="25"
						alt="Black and White Portrait of a Man" loading="lazy" />
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuAvatar">
						<li><a class="dropdown-item" href="#">My profile</a></li>
						<li><a class="dropdown-item" href="ShowReservation.jsp">My
								Reservation</a></li>
						<li><a class="dropdown-item" href="#" id="logout-button">Logout</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- Right elements -->
			
			
			<!-- log out conformation model -->
			<div class="modal" tabindex="-1" role="dialog" id="logoutModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Logout Confirmation</h5>
							<button type="button" class="close" id='close'
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to log out?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="cancel-logout">Cancel</button>
							<button type="button" class="btn btn-primary" id="confirm-logout">Yes</button>
						</div>
					</div>
				</div>
			</div>

			<!-- log out conformation model end -->

			<!-- log out conformation model JS -->
			<script>
				// When the Logout button is clicked, show the confirmation modal
				document.getElementById('logout-button').addEventListener(
						'click', function() {
							$('#logoutModal').modal('show');
						});

				// When the confirmation modal's Yes button is clicked, log out and redirect
				document.getElementById('confirm-logout').addEventListener(
						'click', function() {
							var form = document.createElement('form');
						    form.action = 'LogOutServlet'; // Replace with the actual servlet URL
						    form.method = 'POST';

						    // Append the form to the document and submit it
						    document.body.appendChild(form);
						    form.submit();
							
						});

				document.getElementById('close').addEventListener('click',
						function() {
							$('#logoutModal').modal('hide');
						});

				document.getElementById('cancel-logout').addEventListener(
						'click', function() {
							$('#logoutModal').modal('hide');
						});
			</script>
			<!-- log out conformation model JS end -->
			

		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->

	<%
	TicketDetails ticketDetails = (TicketDetails) request.getAttribute("ticketDetails");
	%>

	<div class="container">
		<div class="ticket-details-container">
			<h2 class="ticket-details-heading">Ticket Details</h2>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Train Number:</p>
				</div>
				<div class="col-md-6">
					<p><%=ticketDetails.getTrain_number()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Train Name:</p>
				</div>
				<div class="col-md-6">
					<p><%=TrainUtil.getTrainName(ticketDetails.getTrain_number())%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Start Point:</p>
				</div>
				<div class="col-md-6">
					<p><%=ticketDetails.getStart_point()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">End Point:</p>
				</div>
				<div class="col-md-6">
					<p><%=ticketDetails.getEnd_point()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Reservation Date:</p>
				</div>
				<div class="col-md-6">
					<p><%=ticketDetails.getReservation_date()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Passenger Count:</p>
				</div>
				<div class="col-md-6">
					<p><%=ticketDetails.getPassenger_count()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Unit price:</p>
				</div>
				<div class="col-md-6">
					<p><%=TrainSheduleUtil.getTicketPrice(ticketDetails.getStart_point(),ticketDetails.getEnd_point()) %></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p class="ticket-details-label">Total price:</p>
				</div>
				<div class="col-md-6">
					<p><%=(TrainSheduleUtil.getTicketPrice(ticketDetails.getStart_point(),ticketDetails.getEnd_point()))*ticketDetails.getPassenger_count() %></p>
				</div>
			</div>
		</div>
	</div>


	<!--payment gate way-->

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<h2 class="card-title text-center">TrainEase Payment Gateway</h2>
					<form id="payment-form">
						<div class="form-group">
							<label for="card-element">Credit or debit card</label>
							<div id="card-element" class="form-control">
								<!-- A Stripe Element will be inserted here. -->
							</div>
							<!-- Used to display form errors. -->
							<div id="card-errors" role="alert"></div>
						</div>
						<button class="btn btn-primary btn-block">Submit Payment</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Stripe.js -->
	<script src="https://js.stripe.com/v3/"></script>

	<!-- Modal -->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Payment
						Successful</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Congratulations! Your payment was
					successful. Your e-tickets have been generated.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="placeReservation()"> OK </button>
				</div>
			</div>
		</div>
	</div>

	<script>

	
		var stripe = Stripe('pk_test_XXXXXXXXXXXXXXXXXXXXXXXX'); // Replace with your actual Stripe public key
		var elements = stripe.elements();

		var style = {
			base : {
				fontSize : '16px',
				color : '#32325d',
			},
		};

		var card = elements.create('card', {
			style : style
		});
		card.mount('#card-element');

		card.addEventListener('change', function(event) {
			var displayError = document.getElementById('card-errors');
			if (event.error) {
				displayError.textContent = event.error.message;
			} else {
				displayError.textContent = '';
			}
		});

		var form = document.getElementById('payment-form');

		form.addEventListener('submit', function(event) {
			event.preventDefault();
			
			$('#successModal').modal('show');
			
			 
			<!--alert("Payment successful!");-->

			<!-- window.location.href = "https://example.com/success-page.html"; -->
		});
		
		
		function placeReservation() {
		    var form = document.createElement('form');
		    form.action = 'PlaceReservation'; // Replace with the actual servlet URL
		    form.method = 'POST';

		 // Create hidden input fields for the ticket details
		 
		 	var userIdInput = document.createElement('input');
		 	userIdInput.type = 'hidden';
		 	userIdInput.name = 'userId';
		    userIdInput.value = <%=LogInUser.getUserId() %>;
		    form.appendChild(userIdInput);
		 
		    var trainNumberInput = document.createElement('input');
		    trainNumberInput.type = 'hidden';
		    trainNumberInput.name = 'train_number';
		    trainNumberInput.value = '<%= ticketDetails.getTrain_number() %>';
		    form.appendChild(trainNumberInput);

		    var trainNameInput = document.createElement('input');
		    trainNameInput.type = 'hidden';
		    trainNameInput.name = 'train_name';
		    trainNameInput.value = '<%= TrainUtil.getTrainName(ticketDetails.getTrain_number()) %>';
		    form.appendChild(trainNameInput);

		    var startPointInput = document.createElement('input');
		    startPointInput.type = 'hidden';
		    startPointInput.name = 'start_point';
		    startPointInput.value = '<%= ticketDetails.getStart_point() %>';
		    form.appendChild(startPointInput);

		    var endPointInput = document.createElement('input');
		    endPointInput.type = 'hidden';
		    endPointInput.name = 'end_point';
		    endPointInput.value = '<%= ticketDetails.getEnd_point() %>';
		    form.appendChild(endPointInput);

		    var reservationDateInput = document.createElement('input');
		    reservationDateInput.type = 'hidden';
		    reservationDateInput.name = 'reservation_date';
		    reservationDateInput.value = '<%= ticketDetails.getReservation_date() %>';
		    form.appendChild(reservationDateInput);

		    var passengerCountInput = document.createElement('input');
		    passengerCountInput.type = 'hidden';
		    passengerCountInput.name = 'passenger_count';
		    passengerCountInput.value = '<%= ticketDetails.getPassenger_count() %>';
		    form.appendChild(passengerCountInput);

		    var unitPriceInput = document.createElement('input');
		    unitPriceInput.type = 'hidden';
		    unitPriceInput.name = 'unit_price';
		    unitPriceInput.value = '<%= TrainSheduleUtil.getTicketPrice(ticketDetails.getStart_point(),ticketDetails.getEnd_point()) %>';
		    form.appendChild(unitPriceInput);

		    var totalPriceInput = document.createElement('input');
		    totalPriceInput.type = 'hidden';
		    totalPriceInput.name = 'total_price';
		    totalPriceInput.value = '<%= (TrainSheduleUtil.getTicketPrice(ticketDetails.getStart_point(),ticketDetails.getEnd_point())) * ticketDetails.getPassenger_count() %>';
		    form.appendChild(totalPriceInput);

		    // Append the form to the document and submit it
		    document.body.appendChild(form);
		    form.submit();
		}
		
		
	</script>

	<!-- Include Bootstrap JS and MDB JS here -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>

</body>
</html>
