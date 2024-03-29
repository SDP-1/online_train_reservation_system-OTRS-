<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    
    <!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css"
	rel="stylesheet" />
    
    <style>
        /* Internal CSS */
        body {
            background-image: url('http://localhost:8080/OTRS/image/gallery-3.jpg'); /* background image */
            background-size: cover; /* Make sure the image covers the entire background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
         //   display: flex;
          //  justify-content: center;
          //  align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for the form */
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Style for the welcome message container */
        .welcome-container {
            background-color: #007bff; /* Blue background color */
            color: #fff; /* White text color */
            text-align: center;
            padding: 10px; /* Padding around the welcome message */
            border-radius: 5px; /* Rounded corners */
            margin-bottom: 20px; /* Space between welcome message and form */
        }

        /* Style for the welcome message text */
        .welcome-message {
            font-size: 18px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 3px;
            width: 100%;
        }

        a {
            text-decoration: none;
            display: block;
            text-align: center;
            color: #007bff;
        }

        /* Style for error message */
        .error-message {
            color: red;
            font-size: 14px;
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

				<!-- log in options -->

				<div class="d-flex align-items-center">
					<button type="button" class="btn btn-link px-3 me-2"
						onclick="window.location.href = 'login.jsp'">Login</button>
					<button type="button" class="btn btn-primary me-3"
						onclick="window.location.href = 'createAccount.jsp'">Sign up for
						free</button>
				</div>


			</div>
			<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->

    <div class="container" style="margin-top: 20px">
        <div class="welcome-container">
            <p class="welcome-message"><h3>Welcome to Travel Buddy Online Train Reservation System.</h3> <h6 style="color: #ff9900;">In here, you can register to the system. After Successful registration, you'll be redirected to the login page.</h6></p>
        </div>
        <h2>Create Account</h2>
        <form action="UserCreateAccServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>
                <span class="error-message" id="email-error"></span>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" required>
                <span class="error-message" id="phone-error"></span>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="uid" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="psw" required>
            </div>
            <div class="form-group">
                <label for="repassword">Re-enter Password:</label>
                <input type="password" id="repassword" name="repassword" required>
                <span class="error-message" id="password-error"></span>
            </div>
            
            <div class="form-group">
                <input type="submit" name="submit" value="Create Account" class="btn">
            </div>
        </form>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
        <script>
            function validateForm() {
                // Validation for phone number (10 digits)
                var phone = document.getElementById("phone").value;
                var phoneError = document.getElementById("phone-error");
                var phonePattern = /^\d{10}$/;
                if (!phone.match(phonePattern)) {
                    phoneError.textContent = "Phone number must contain exactly 10 digits.";
                    return false;
                } else {
                    phoneError.textContent = "";
                }
                
                // Validation for email (______@gmail.com)
                var email = document.getElementById("email").value;
                var emailError = document.getElementById("email-error");
                var emailPattern = /^[A-Za-z0-9._%+-]+@gmail.com$/;
                if (!email.match(emailPattern)) {
                    emailError.textContent = "Email must be in the format ______@gmail.com.";
                    return false;
                } else {
                    emailError.textContent = "";
                }
                
                // Validation for password match
                var password = document.getElementById("password").value;
                var repassword = document.getElementById("repassword").value;
                var passwordError = document.getElementById("password-error");
                
                if (password !== repassword) {
                    passwordError.textContent = "Passwords do not match.";
                    return false;
                } else {
                    passwordError.textContent = "";
                }
                
                return true;
            }
        </script>
    </div>
    
    <script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>
</body>
</html>
