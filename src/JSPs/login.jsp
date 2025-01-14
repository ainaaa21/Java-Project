<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <form action="LoginController" method="post">
        <div class="content">
            <div class="left-side">
                <img src="images/image1.png" alt="Camp Image 1" class="camp-image1">
                <img src="images/image2.png" alt="Camp Image 2" class="camp-image2">
                <img src="images/image3.png" alt="Camp Image 3" class="camp-image3">
            </div>
            <div class="right-side">
                <h2 class="login-title">Let's Login!</h2>
                <div class="oval-fields">
                    <input type="email" id="useremail" name="useremail" required placeholder="Your Email">
                    <input type="password" id="userpassword" name="userpassword" required placeholder="Your Password">
                    <input type="submit" value="Login">
                    <p class="camp">© 2024 CampBersama.Co. All rights reserved.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
