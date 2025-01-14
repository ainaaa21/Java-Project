<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customer</title>
<link rel="stylesheet" href="view.css">
</head>
<body>
	<div class="header">
		<h1>VIEW CUSTOMER DETAILS</h1>
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
			<div class="wrapper">
				<%
				// Assuming you have a customerId parameter coming from somewhere, like a request parameter or session attribute.
				String custIdParam = request.getParameter("custId");

				if (custIdParam != null) {
					int custId = Integer.parseInt(custIdParam);

					try {
						// Establish a database connection. Replace these details with your database connection parameters.
						String url = "jdbc:mysql://localhost/campsite";
						String username = "root";
						String password = "";
						Connection connection = DriverManager.getConnection(url, username, password);
						Statement statement = connection.createStatement();

						// Query to retrieve customer details based on customerId. Adjust this query based on your database schema.
						String sql = "SELECT c.custId,c.custName AS name,c.custAddress AS address,c.custContact AS contact,u.email FROM customer c JOIN user u ON c.custId = u.custId WHERE c.custId = ?";
						PreparedStatement ps = connection.prepareStatement(sql);
						ps.setInt(1, custId); // Set the parameter for the query
						ResultSet rs = ps.executeQuery();

						if (rs.next()) {
					String name = rs.getString("name");
					String address = rs.getString("address");
					String contact = rs.getString("contact");
					String customerId = rs.getString("custId"); // Use a different variable name to avoid conflict
					String email = rs.getString("email");

					// Display customer details
				%>
				<div class="customer-details">
					<h2>Customer Details</h2><br>
					<p>
						Name:
						<%=name%></p>
					<p>
						Address:
						<%=address%></p>
					<p>
						Contact:
						<%=contact%></p>
					<p>
						Customer ID:
						<%=customerId%></p>
					<p>
						Email:
						<%=email%></p>
				</div>
				<%
				} else {
				// Handle case where no customer is found with the given ID
				out.println("Customer not found.");
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
				out.println("Customer ID not provided.");
				}
				%>

			</div>
			<img src="/StaffCamp/img/staff4.png" class="staff4-image">
		</div>

		<div class="column side"></div>
	</div>
</body>
</html>
