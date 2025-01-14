<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Booking</title>
<link rel="stylesheet" href="updatebooking.css">
<script>
    function confirmUpdate() {
        return confirm("Are you sure you want to update the booking details?");
    }
</script>
</head>
<body>
    <div class="header">
        <h1>UPDATE BOOKING</h1>
        <button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
    </div>

    <div class="row">
        <div class="column side"></div>

        <div class="column middle">
            <div class="navbar">
                <a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> 
                <a href="CustomerList.jsp" class="nav-link active">CUSTOMER LISTS&emsp;&emsp;</a>
                <a href="BookingStaff.jsp" class="nav-link">BOOKING LISTS&emsp;&emsp;</a> 
                <a href="ProfileStaff.jsp" class="nav-link">PROFILE</a>
            </div>

            <div class="booking-form">
                <form action="UpdateBookingAction" method="post" onsubmit="return confirmUpdate()">
                    <label for="bookId">Booking ID:</label>
                    <input type="text" id="bookId" name="bookId" value="<%= request.getParameter("bookId") %>" readonly>
                    
                    <label for="custId">Customer ID:</label>
                    <input type="text" id="custId" name="custId" value="<%= request.getParameter("custId") %>" readonly>
                    
                    <label for="campType">Camp Type:</label>
                    <input type="text" id="campType" name="campType" value="<%= request.getParameter("campType") %>" readonly>
                    
                    <label for="checkIn">Check-In Date:</label>
                    <input type="date" id="checkIn" name="checkIn" value="<%= request.getParameter("checkIn") %>">
                    
                    <label for="checkOut">Check-Out Date:</label>
                    <input type="date" id="checkOut" name="checkOut" value="<%= request.getParameter("checkOut") %>">
                    
                    <label for="addOn">Add-On:</label>
                    <div class="service">
                        <input type="checkbox" id="wifi" value="wifi" name="addOn">
                        <label for="wifi">Wi-Fi Access (RM20)</label>

                        <input type="checkbox" id="equipment" value="equipment" name="addOn">
                        <label for="equipment">Equipment Rental (RM100)</label>

                        <input type="checkbox" id="campfire" value="campfire" name="addOn">
                        <label for="campfire">Campfire Setup (RM80)</label>
                    </div>
                    <button type="submit">Update</button>
                </form>
                <img src="/StaffCamp/img/staff5.png" class="staff5-image">
            </div>
        </div>

        <div class="column side"></div>
    </div>
</body>
</html>
