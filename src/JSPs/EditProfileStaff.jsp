<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Staff's Profile</title>
    <link rel="stylesheet" href="editprofileS.css">
</head>
<body>
    <div class="header">
        <h1>STAFF'S PROFILE</h1>
        <button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
    </div>

    <div class="row">
        <div class="column side"></div>

        <div class="column middle">
            <div class="navbar">
                <a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> <a
                    href="CustomerList.jsp" class="nav-link">CUSTOMER
                    LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp" class="nav-link">BOOKING
                    LISTS&emsp;&emsp;</a> <a href="ProfileStaff.jsp"
                    class="nav-link active">PROFILE</a>
            </div>
            <form action="StaffController?action=updateStaffProfile" method="post"> <!-- Update the action attribute -->
                <div class="boxform">
                    <h1>Edit Profile</h1>
                    <br>
                    <br> <label for="name">Name:</label> <input type="text"
                        id="name" name="staffName"
                        value="<%=request.getAttribute("staffName")%>"><br>
                    <br>
                    <br> <label for="address">Address:</label> <input type="text"
                        id="address" name="staffAddress"
                        value="<%=request.getAttribute("staffAddress")%>"><br>
                    <br>
                    <br> <label for="contact">Contact:</label> <input type="text"
                        id="contact" name="staffContact"
                        value="<%=request.getAttribute("staffContact")%>"><br>
                    <br>
                    <br> <label for="email">Email:</label> <input type="email"
                        id="email" name="staffMail"
                        value="<%=request.getAttribute("staffMail")%>"><br>
                    <br>
                    <br> <input type="submit" value="Update">
                </div>
            </form>
            <div class="design"><img src="/StaffCamp/img/staff3.png"" class="staff3-image"> 
            </div>
        </div>

        <div class="column side"></div>
    </div>
</body>
</html>
