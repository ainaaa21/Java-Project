<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="camp.model.BookingBean"%>
<%@ page import="camp.dao.BookingDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link rel="stylesheet" href="bookingstaff.css">
<script>
	function confirmDelete(bookId) {
		var confirmDelete = confirm("Are you sure you want to delete this booking?");
		if (confirmDelete) {
			window.location.href = 'BookingController?action=deleteBooking&bookId='
					+ bookId;
		}
	}
</script>
</head>
<body>
	<div class="header">
		<h1>BOOKING LIST</h1>
		<button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
	</div>

	<div class="row">
		<div class="column side"></div>

		<div class="column middle">
			<div class="navbar">
				<a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> <a
					href="CustomerList.jsp" class="nav-link">CUSTOMER
					LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp"
					class="nav-link active">BOOKING LISTS&emsp;&emsp;</a> <a
					href="ProfileStaff.jsp" class="nav-link">PROFILE</a>
			</div>
			<br>
			<!-- Add search box and form -->
			<div class="search-container">
				<form action="BookingStaff.jsp" method="get">
					<label for="search">Search by Booking ID:</label> <input
						type="text" id="search" name="bookId"
						placeholder="Enter booking ID...">
					<button type="submit">Search</button>
				</form>
			</div>

			<table border="1">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Check-In</th>
						<th>Check-Out</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
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
							out.println("<td>" + checkOut + "</td>");
							out.println("<td>");
							// View link
							out.println("<a class='view' href='viewBookingStaff.jsp?bookId=" + bookId + "'>View</a> ");
							// Update link
							out.println("<a class='update' href='UpdateBooking.jsp?bookId=" + bookId + "'>Update</a> ");
							// Delete link with confirmation
							out.println("<a class='delete' href='javascript:void(0);' onclick='confirmDelete(" + bookId + ")'>Delete</a>");
							out.println("</td>");
							out.println("</tr>");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>

				</tbody>
			</table>

		</div>

		<div class="column side"></div>
	</div>
</body>
</html>
