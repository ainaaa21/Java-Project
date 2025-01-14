<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="signup.css">
</head>
<body>
    <form action="SignUpController" method="post">
        <div class="content">
            <div class="left-side">
                <img src="images/image1.png" alt="Camp Image 1" class="camp-image1">
                <img src="images/image2.png" alt="Camp Image 2" class="camp-image2">
                <img src="images/image3.png" alt="Camp Image 3" class="camp-image3">
            </div>
            <div class="right-side">
                <h2 class="signup-title">Let's Sign Up!</h2>
                <div class="oval-fields">
                    <input type="text" name="name" required placeholder="Your Full Name">
                    <input type="address" name="address" required placeholder="Your Address">
                    <input type="text" name="contact" required placeholder="Your Contact Number">
                    <input type="email" name="email" required placeholder="Your Email">
                    <input type="password" name="password" required placeholder="Your Password">
                    <select name="role" required>
                        <option value="" disabled selected>Select role</option>
                        <option value="Staff">Staff</option>
                        <option value="Customer">Customer</option>
                    </select>
                    <input type="submit" value="Sign Up">
                    <p class="camp">© 2024 CampBersama.Co. All rights reserved.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
