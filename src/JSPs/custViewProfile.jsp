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
    }
    
    .custProfile {
      margin: 0 40px;
      background-color: #ffc783;
      padding: 30px;
      font-size: 20px;
      
    }

    .editProfileButton  {
      display: flex;
      justify-content: center;
    }

    .profileEditB {
      background-color: #dbf4a1;
      font-size: 23px;
      font-weight: bold;
      border: none;
      border-radius: 40px;
      padding: 20px 30px;
      margin-top: 50px;
      margin-bottom: 100px;
      text-decoration: none;
      cursor: pointer;
    }

    .hello {
      font-size: 100px;
    }

    .footer {
      padding: 20px;
      text-align: center;
    }


  </style>
  </head>

  

  <body>

    <div class="header">
      <h1>CUSTOMER'S PROFILE</h1>
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
      
        <div class="custProfile">
        
        
        <p>
          <b>Name:</b> <c:out value="${customer.custName}" /> <br><br>
          <b>Address:</b> <c:out value="${customer.custAddress}" /> <br><br>
          <b>Email Address:</b> <c:out value="${customer.custMail}" /> <br><br>
          <b>Contact Number:</b>  <c:out value="${customer.custContact}" />
        </p>
          
        </div>

        <div class="editProfileButton">
          <a class="profileEditB" href="custEditProfile.jsp">EDIT PROFILE</a>
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