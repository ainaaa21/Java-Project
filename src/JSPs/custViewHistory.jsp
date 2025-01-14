<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Camp Management System Customer Main Page</title>
    <!-- <link rel="stylesheet" href="custMain.css">  -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
    * {
      box-sizing: border-box;
    }

    body {
      font-family: Roboto, Arial;
      margin: 0px;
      min-height: 100vh; 
      display: flex;
      flex-direction: column;
    }
    
    .row {
	  flex: 1; /* Allow the .row to grow and take the remaining vertical space */
	  display: flex;
	  flex-wrap: wrap;
	}

    .header {
      padding: 1px;
      text-align: center;
      letter-spacing: 8px;
      background: #495a21;
      color: #fdfcfd;
      position: relative; /* Add position: relative; to the .header */
    }

    .logout {
      background-color: #3460a4;
      color: white;
      border-radius: 20px;
      padding: 10px;
      position: absolute; /* Add position: absolute; */
      top: 60%; /* Position it vertically at 50% from the top */
      transform: translateY(-50%); /* Adjust vertical positioning */
      right: 20px; /* Adjust the right margin as needed */
      cursor: pointer;
    }

    .navbar {
      display: flex;
      background-color: #dbf4a1;
    }

    .navbar a{
      flex: 100%;
      color: #181b12;
      padding: 14px 20px;
      text-decoration: none;
      text-align: center;
     
    }

    .navbar a:hover {
      background-color: #4f4828;
      color: white;
      font-weight: bold;
    }

    .row {
      display: flex;
      flex-wrap: wrap;
    }

    .side {
      flex: 10%;
      background-color: #c1cfa0;
      padding: 20px;
    }

    .main {
      flex: 80%;
      background-color: #eaefdf;
      padding: 20px;
    }
	
	.description {
      max-width: 500px;
      margin: 20px auto;
      background: #dbf4a1;
      padding: 35px 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
	
    .receipt {
      max-width: 600px;
      margin: 20px auto;
      background: #fff;
      padding: 35px 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }

    .buttonContainer {
      display: flex;
      justify-content: center;
      margin: 50px auto 20px;
    }
    
    .submitB {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      margin: 0 10px;

    }

    .resetB {
      background-color: red;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      margin: 0 10px;

    }

    .footer {
      padding: 20px;
      text-align: center;
    }


  </style>
  </head>

  

  <body>

    <div class="header">
      <h1>CUSTOMER'S VIEW HISTORY</h1>
      <button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
    </div>

    <div class="navbar">
      <a href="custMain.jsp" >HOME</a>
      <a href="custViewProfile.jsp" >PROFILE</a>
      <a href="bookingForm.jsp" >BOOK CAMPSITE</a>
      <a href="custHistory.jsp"/><b>HISTORY OF PAST BOOKING</b></a>
    </div>

    <div class="row">
      <div class="side">
        
      </div>

      <div class="main">
        <h3>CampBersama.co</h3>
        <div class="receipt">
        
          <%
				// Assuming you have a customerId parameter coming from somewhere, like a request parameter or session attribute.
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
       
          
        </div>
        
      </div>

      <div class="side">
        
      </div>
    </div>

    <div class="footer" style="background: #333f17; color: #fdfcfd;">
      <p>© 2024 CampBersama.co. All rights reserved. Embark on memorable outdoor adventures with us.</p>
    </div>

  </body>
</html>