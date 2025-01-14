<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Booking Form</title>
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
        flex: 1;
        display: flex;
        flex-wrap: wrap;
      }

      .header {
        padding: 1px;
        text-align: center;
        letter-spacing: 8px;
        background: #495a21;
        color: #fdfcfd;
        position: relative;
      }

      .logout {
        background-color: #3460a4;
        color: white;
        border-radius: 20px;
        padding: 10px;
        position: absolute;
        top: 60%;
        transform: translateY(-50%);
        right: 20px;
        cursor: pointer;
      }

      .navbar {
        display: flex;
        background-color: #dbf4a1;
      }

      .navbar a {
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
        align-items: center;
      }

      .images-container {
        display: flex;
        align-items: flex-start;
        margin-bottom: 200px; /* Add margin to separate images from form */
      }

      .left-images img {
		  width: 350px;
		  height: 250px;
		  border-radius: 8px;
		  margin-right: 10px;
		  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		  transition: transform 0.3s ease-in-out;
		  position: relative;
		}

		.left-images img:hover {
		  transform: scale(1.1);
		}
		
		.left-images img::after {
		  content: attr(data-text);
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  padding: 10px;
		  background: rgba(255, 255, 255, 0.9);
		  border-radius: 8px;
		  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		  text-align: center;
		  visibility: hidden;
		  opacity: 0;
		  z-index: 1;
		  transition: visibility 0s, opacity 0.5s linear;
		}
		
		.left-images img:hover::after {
		  visibility: visible;
		  opacity: 1;
		}

      .description {
        max-width: 500px;
        margin-left: 100px; /* Add margin to separate form from images */
        background: #dbf4a1;
        padding: 20px 20px 35px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      }

      form {
        max-width: 600px;
        background: #fff;
        padding: 35px 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      }

      .facility,
      .checkin,
      .checkout {
        width: 100%;
        padding: 10px;
        margin: 10px 0 50px ;
        border-radius: 8px;
      }

      .service {
        margin: 25px 15px 20px ;
      }

      .term {
        background-color: #dbf4a1;
        padding: 20px;
        margin: 50px 15px 20px ;
      }

      .condition {
        text-align: justify;
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
      <h1>CUSTOMER'S BOOKING FORM</h1>
      <button onclick="window.location.href='index.html'" class="logout">LOGOUT</button>
    </div>

    <div class="navbar">
      <a href="custMain.jsp" >HOME</a>
      <a href="custViewProfile.jsp" >PROFILE</a>
      <a href="bookingForm.jsp" ><b>BOOK CAMPSITE</b></a>
      <a href="custHistory.jsp"/>HISTORY OF PAST BOOKING</a>
    </div>

    <div class="row">
      <div class="side"></div>

      <div class="main">
        <h3>CampBersama.co</h3>

        <div class="images-container">
          <!-- Left side images -->
          <div class="left-images">
            <img src="images/basic.jpg" alt="basic" data-text="Basic Campsite"><br>
			<img src="images/standard.jpg" alt="standard" data-text="Standard Campsite"><br>
			<img src="images/premium.jpg" alt="premium" data-text="Premium Campsite"><br>
			<img src="images/family.jpg" alt="family" data-text="Family Campsite"><br>
			<img src="images/group.jpg" alt="group" data-text="Group Campsite"><br>
          </div>

          <!-- Description -->
          <div class="description">
            <p class="introDesc">Plan your perfect camping experience at CampBersama.co by choosing from our diverse range of campsites.</p><br>

            1. Basic Campsite: 1-4 participants @ RM 50 per night. <br>
            2. Standard Campsite: 1-6 participants @ RM 80 per night. <br>
            3. Premium Campsite: 1-8 participants @ RM 120 per night. <br>
            4. Family Campsite: 1-10 participants @ RM 150 per night. <br>
            5. Group Campsite: 10-20 participants @ RM 250 per night. <br><br>
          

        <!-- Booking Form -->
        <form action="BookingController" method="post">
          Choose your Campsite:<br>
          <select class="facility" name="campType" required>
            <option value="Basic Campsite">Basic Campsite</option>
            <option value="Standard Campsite">Standard Campsite</option>
            <option value="Premium Campsite">Premium Campsite</option>
            <option value="Family Campsite">Family Campsite</option>
            <option value="Group Campsite">Group Campsite</option>
          </select>

          <br>

          Check-in Date:<br>
          <input class="checkin" type="date" name="checkIn" required>

          <br>

          Check-out Date:<br>
          <input class="checkout" type="date" name="checkOut" required>

          <br>

          Additional Services:<br>
          <input type="checkbox" class="service" value="wifi" name="addOn">Wi-Fi Access (RM20)<br>
          <input type="checkbox" class="service" value="equipment" name="addOn">Equipment Rental (RM100)<br>
          <input type="checkbox" class="service" value="campfire" name="addOn">Campfire Setup (RM80)<br>

          <div class="term">
            <input type="checkbox" class="condition" value="condition" name="term" required>I have read and agree to the terms and conditions of the campsite, including its policies, rules, and regulations.
            I understand that failure to comply may result in the cancellation of my booking.<br>
          </div>

          <div class="buttonContainer">
            <input class="submitB" type="submit" value="SUBMIT">
            <input class="resetB" type="reset" value="RESET">
          </div>
        </form>
      </div>
      </div>
        </div>

      <div class="side"></div>
    </div>

    <div class="footer" style="background: #333f17; color: #fdfcfd;">
      <p>© 2024 CampBersama.co. All rights reserved. Embark on memorable outdoor adventures with us.</p>
    </div>

  </body>
</html>