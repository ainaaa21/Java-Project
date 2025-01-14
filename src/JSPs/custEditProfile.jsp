<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      display: flex;
      flex-direction: column;
    }
    
    .editProfileForm {
    	display: flex;
        align-items: flex-start;
    	position: relative;
    }
    
    .man {
    	max-width: 25%;
    	margin-top: 40px;
    }
    
    .pole {
    	max-width: 25%;
    	margin-right: 20px;
    }

    form {
      max-width: 600px;
      margin: 0px auto 20px;
      background: #fff;
      padding: 35px 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }

    .name,
    .address,
    .email,
    .contact {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border-radius: 8px;

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

    .cancelB {
      background-color: red;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      margin: 0 10px;
      text-decoration: none;
    }

    .footer {
      padding: 20px;
      text-align: center;
    }

  </style>
  </head>

  

  <body>

    <div class="header">
      <h1>CUSTOMER'S PROFILE EDITING</h1>
      <button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
    </div>

    <div class="navbar">
      <a href="custMain.jsp" >HOME</a>
      <a href="custViewProfile.jsp" ><b>PROFILE</b></a>
      <a href="bookingForm.jsp" >BOOK CAMPSITE</a>
      <a href="custHistory.jsp" >HISTORY OF PAST BOOKING</a>
    </div>

    <div class="row">
      <div class="side">
        
      </div>

      <div class="main">
        <h3>CampBersama.co</h3>
        
        <div class="editProfileForm">
          
          <img class="man" src="images/manwalk.png">
          <form action="CustomersController?action=updateCustomer" method="post">
          
            <h2 style="text-align: center; margin: 0 auto 40px;">Fill in the form below.</h2>
            
            Name: 
            <input class="name" type="text" name="custName"  
            value="<c:out value="${customer.custName}"/>"/> <br><br>
            Address: 
            <input class="address" type="text" name="custAddress" 
            value="<c:out value="${customer.custAddress}"/>"/> <br><br>
            Email Address: 
            <input class="email" type="email" name="custMail" 
            value="<c:out value="${customer.custMail}"/>"/> <br><br>
            Contact Number: 
            <input class="contact" type="tel" name="custContact" 
            value="<c:out value="${customer.custContact}"/>"/> <br>

            <div class="buttonContainer">
            
            <input class="submitB" type="submit" value="SUBMIT">
            <a class="cancelB" href="custViewProfile.jsp">CANCEL</a>
            
            </div>
          </form>
          
          <img class="pole" src="images/pole.png">
          
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