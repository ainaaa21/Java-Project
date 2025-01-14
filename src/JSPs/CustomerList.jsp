<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="camp.model.CustomerBean"%>
<%@ page import="camp.dao.CustomerDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
<link rel="stylesheet" href="customerlist.css">
</head>
<body>
	<div class="header">
		<h1>CUSTOMER LIST</h1>
		<button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
	</div>

	<div class="row">
		<div class="column side"></div>

		<div class="column middle">
			<div class="navbar">
				<a href="HomepageStaff.jsp" class="nav-link">HOME&emsp;&emsp;</a> <a
					href="CustomerList.jsp" class="nav-link active">CUSTOMER
					LISTS&emsp;&emsp;</a> <a href="BookingStaff.jsp" class="nav-link">BOOKING
					LISTS&emsp;&emsp;</a> <a href="ProfileStaff.jsp" class="nav-link">PROFILE</a>
			</div>

			<!-- Add search box and form -->
			<div class="search-container">
				<form action="CustomerList.jsp" method="get">
					<label for="search">Search by Name:</label>
					<input type="text" id="search" name="search" placeholder="Enter customer name...">
					<button type="submit">Search</button>
				</form>
			</div>

			<table border="1">
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Name</th>
						<th>Contact</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						List<CustomerBean> customers;

						String searchName = request.getParameter("search");

						if (searchName != null && !searchName.isEmpty()) {
							customers = CustomerDAO.searchCustomersByName(searchName);
						} else { 
							customers = CustomerDAO.getAllCustomers();
						}

						for (CustomerBean customer : customers) {
							int custId = customer.getCustId();
							String custName = customer.getCustName();
							String custContact = customer.getCustContact();

							// Output data row
							out.println("<tr>");
							out.println("<td>" + custId + "</td>");
							out.println("<td>" + custName + "</td>");
							out.println("<td>" + custContact + "</td>");
							out.println("<td>");
							out.println("<a class='view' href='viewCustomer.jsp?custId=" + custId + "'>View</a> ");
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
