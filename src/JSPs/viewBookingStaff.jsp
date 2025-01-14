<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Booking</title>
<link rel="stylesheet" href="viewbookingStaff.css">
</head>
<body>
	<div class="header">
		<h1>VIEW BOOKING LISTS</h1>
		<button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
	</div>

	<div class="row">
		<div class="column side"></div>

		<div class="column middle">
			<div class="navbar">
				<a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> <a
					href="CustomerList.jsp" class="nav-link">CUSTOMER
					LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp" class="nav-link">BOOKING
					LISTS&emsp;&emsp;</a> <a href="ProfileStaff.jsp" class="nav-link">PROFILE</a>
			</div>
			<%
			// Retrieve bookId from request parameters
			String bookIdParam = request.getParameter("bookId");

			if (bookIdParam != null && !bookIdParam.isEmpty()) {
				int bookId = Integer.parseInt(bookIdParam);
				try {
					// Establish a database connection. Replace these details with your database connection parameters.
					String url = "jdbc:mysql://localhost/campsite";
					String username = "root";
					String password = "";
					Connection connection = DriverManager.getConnection(url, username, password);
					Statement statement = connection.createStatement();
					// Query to retrieve customer details based on customerId. Adjust this query based on your database schema.
					String sql = "SELECT b.bookId, b.addOn, b.campType, b.checkIn, b.checkOut, c.custId FROM booking b JOIN customer c ON b.custId = c.custId WHERE b.bookId = ?";
					PreparedStatement ps = connection.prepareStatement(sql);
					ps.setInt(1, bookId); // Set the parameter for the query
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
				String bookid = rs.getString("bookid");
				String addon = rs.getString("addon");
				String camptype = rs.getString("camptype");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				String custid = rs.getString("custid");

				// Display customer details
			%>
			<div class="wrapper">
				<h2>Booking Details</h2><br>
				<p>
					Booking ID:
					<%=bookid%></p>
				<p>
					Add-On:
					<%=addon%></p>
				<p>
					Campsite Type:
					<%=camptype%></p>
				<p>
					Check-In Date:
					<%=checkin%></p>
				<p>
					Check-Out Date:
					<%=checkout%></p>
				<p>
					Customer ID:
					<%=custid%></p>
			</div>
			<%
			} else {
			out.println("Booking not found.");
			}

			// Close resources
			rs.close();
			ps.close();
			connection.close();
			} catch (SQLException e) {
			e.printStackTrace();
			// Handle database connection or query error
			out.println("Error connecting to the database.");
			}
			} else {
			// Handle case where customerId parameter is not provided
			out.println("Booking ID not provided.");
			}
			%>
			<img src="/StaffCamp/img/staff6.png" alt="hello" class="staff6-image">			
		</div>
		

		<div class="column side"></div>
	</div>
</body>
</html>
