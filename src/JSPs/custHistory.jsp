<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="camp.model.BookingBean"%>
<%@ page import="camp.dao.BookingDAO"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Customer History</title>
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
      position: relative;
    }

	table {
      width:100%;
    }
    .tableHistory {
      margin: 60px;
    }
    
    th {
      background: #495a21;
      color: #fdfcfd;
      padding: 20px
    }
    
    td {
      background: #fff4e3;
      color: black;
      padding: 20px;
      text-align: center;
    }
    
    td a{
    	text-decoration: none;
		font-weight: bold;
		color: #38B6FF;
    }

    .hello {
      font-size: 150px;
      
    }

    .tent {
      position: absolute;
      top: 10%;
      right: 10%;
    }

    .footer {
      padding: 20px;
      text-align: center;
    }


  </style>
  </head>

  

  <body>

    <div class="header">
      <h1>CUSTOMER'S BOOKING HISTORY</h1>
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
        
        <div class="tableHistory">
          <table>
            <tr>
              <th>BOOKING ID</th>
              <th>DATE</th>
              <th>ACTION</th>
            </tr>
			
			<%
						try {
							// Retrieve the bookId parameter from the request
							String searchBookId = request.getParameter("bookId");

							List<BookingBean> bookings;

							// Check if searchBookId is not null or empty
							if (searchBookId != null && !searchBookId.isEmpty()) {
								// Search for bookings with the specified bookId
								int bookId = Integer.parseInt(searchBookId);
								bookings = BookingDAO.getAllBookingsByBookId(bookId);
							} else {
								// Retrieve all bookings if no bookId is provided
								bookings = BookingDAO.getAllBookings();
							}

							for (BookingBean booking : bookings) {
								int bookId = booking.getBookId();
								java.sql.Date checkIn = booking.getCheckIn();
								java.sql.Date checkOut = booking.getCheckOut();

								// Output data row
								out.println("<tr>");
								out.println("<td>" + bookId + "</td>");
								out.println("<td>" + checkIn + "</td>");
								out.println("<td>");
								// View link
								out.println("<a class='view' href='custViewHistory.jsp?bookId=" + bookId + "'>View</a> ");
								
								out.println("</td>");
								out.println("</tr>");
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					
					
          </table>
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