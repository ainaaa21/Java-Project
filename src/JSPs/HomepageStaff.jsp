<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff's Homepage</title>
<link rel="stylesheet" href="homestaff.css">
</head>
<body>
	<div class="header">
		<h1>STAFF'S HOMEPAGE</h1>
		<button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>

	</div>

	<div class="row">
		<div class="column side"></div>

		<div class="column middle">
			<div class="navbar">
				<a href="HomepageStaff.jsp" class="nav-link active">HOME&emsp;&emsp;</a>
				<a href="CustomerList.jsp" class="nav-link">CUSTOMER
					LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp" class="nav-link">BOOKING
					LISTS&emsp;&emsp;</a> <a href="ProfileStaff.jsp" class="nav-link">PROFILE</a>
			</div>

			<div class="design">
				<br>
				<h3>&emsp;&emsp;&emsp;&emsp;CampBersama.co</h3>
					<img src="img/staff1.png" alt="hello" class="staff1-image">
					<img src="img/staff2.png" alt="hello" class="staff2-image">
			</div>
			<div class="editprofile">
				<a href="EditProfileStaff.jsp" class="nav-link">Edit Profile</a>
			</div>
		</div>

		<div class="column side"></div>
	</div>
</body>
</html>
