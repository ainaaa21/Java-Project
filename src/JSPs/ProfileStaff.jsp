<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="camp.model.StaffBean"%>
<%@ page import="camp.dao.StaffDAO"%>
<%@ page import="camp.dao.UserDAO"%>
<%@ page import="camp.model.UserBean"%>

<!DOCTYPE html>
<%
    // Retrieve user email from the session
    String userEmail = (String) session.getAttribute("userEmail");
%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Staff's Profile</title>
    <link rel="stylesheet" href="profilestaff.css">
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
                <a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> <a href="CustomerList.jsp" class="nav-link">CUSTOMER LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp" class="nav-link">BOOKING LISTS&emsp;&emsp;</a> <a href="ProfileStaff.jsp" class="nav-link active">PROFILE</a>
            </div>
            <br>
            <h3>&emsp;&emsp;CampBersama.co</h3>
            <br> <br>
            <div class="profile-box">
                <h2>Staff's Profile</h2>
                <p>User Email: <%= userEmail %></p>
                <%
                    // Retrieve user email from the request attribute
                    String userId = (String) session.getAttribute("userId");

                    if (userId != null) {
                        try {
                            // Establish a database connection. Replace these details with your database connection parameters.
                            String url = "jdbc:mysql://localhost/campsite";
                            String username = "system";
                            String password = "1234";
                            Connection connection = DriverManager.getConnection(url, username, password);

                            // Query to retrieve staff details based on userId. Adjust this query based on your database schema.
                            String sql = "SELECT s.staffName, s.staffAddress, s.staffContact, u.id AS userId, u.email AS email FROM staff s JOIN user u ON s.staffId = u.staffId WHERE u.email = ?";
                            PreparedStatement ps = connection.prepareStatement(sql);
                            ps.setString(1, userEmail); // Set the parameter for the query
                            ResultSet rs = ps.executeQuery();

                            if (rs.next()) {
                                String name = rs.getString("staffName");
                                String address = rs.getString("staffAddress");
                                String contact = rs.getString("staffContact");
                                userId = rs.getString("userId"); // Update the existing variable
                                String email = rs.getString("email");

                                // Display staff details
                %>
                                <div class="customer-details">
                                    <h2>Staff Details</h2>
                                    <br>
                                    <p>Name: <%= name %></p>
                                    <p>Address: <%= address %></p>
                                    <p>Contact: <%= contact %></p>
                                    <p>User ID: <%= userId %></p>
                                    <p>Email: <%= email %></p>
                                </div>
                <%
                            } else {
                                // Handle case where no staff is found with the given ID
                                out.println("Data not found.");
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
                        // Handle case where userId attribute is not provided
                        out.println("User ID not provided.");
                    }
                %>
            </div>

            <div class="design">
                <br>
            </div>
            <div class="editprofile">
                <a href="EditProfileStaff.jsp" class="nav-link">Edit Profile</a>
            </div>
        </div>

        <div class="column side"></div>
    </div>
</body>
</html>
