<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Global Styles */
        body {
            font-family: 'Georgia', serif;
            margin: 0;
            padding: 0;
            background-color: #f4f1e1 !important; /* Classic light beige background */
        }

        h2 {
            margin: 0;
            color: #2f4f4f; /* Dark slate gray color */
            font-size: 28px;
            text-align: center;
        }

        /* Registration Page */
        .registration-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .registration-card {
            display: flex;
            flex-direction: column;
            background: #ffffff; /* Classic white background for card */
            border-radius: 12px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            padding: 30px;
        }

        /* More specific */
        body .registration-card .form-group label {
            color: #8b4513;
        }

        /* Form Section */
        .form-section {
            padding: 20px;
        }

        .form-section h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #8b4513; /* Saddle brown color */
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 8px;
            color: #2f4f4f; /* Dark slate gray color */
        }

        .form-group input {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            border: 1px solid #dcdcdc; /* Light gray border */
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #8b4513; /* Saddle brown color on focus */
            box-shadow: 0px 0px 6px rgba(139, 69, 19, 0.3);
            outline: none;
        }

        .register-button {
            width: 100%;
            background: #8b4513; /* Saddle brown color */
            color: #fff;
            padding: 14px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .register-button:hover {
            background-color: #a0522d; /* Sienna color on hover */
        }

        .extra-links {
            text-align: center;
            margin-top: 15px;
        }

        .extra-links a {
            text-decoration: none;
            color: #8b4513;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .extra-links a:hover {
            color: #a0522d; /* Sienna color on hover */
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* Image Section with Classic design */
        .image-section {
            background-image: url('https://www.example.com/your-image.jpg'); /* Replace with your image link */
            background-position: center;
            background-size: cover;
            border-radius: 12px;
            height: 350px;
            width: 100%;
            margin-top: 30px;
        }

        .form-group label i {
            margin-right: 8px; /* Space between icon and text */
            color: #8b4513; /* Icon color matching the design */
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .registration-card {
                width: 90%;
                max-width: 500px;
            }

            .form-group input {
                padding: 15px;
                font-size: 16px;
            }

            .register-button {
                font-size: 16px;
                padding: 12px;
            }

            .extra-links a {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<%@ include file="demoheader.jsp" %>

<div class="registration-container">
    <div class="registration-card">
        <!-- Form Section -->
        <div class="form-section">
            <h2>User Registration</h2>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <form action="/checkuserregister" method="POST">
    <div class="form-group">
        <label for="name"><i class="fas fa-user"></i> Name</label>
        <input type="text" id="name" name="name" required pattern="[A-Za-z\s]+" title="Name should contain only letters and spaces.">
    </div>
    <div class="form-group">
        <label for="phone"><i class="fas fa-phone"></i> Phone (10 digits)</label>
        <input type="tel" id="phone" name="phone" required pattern="\d{10}" title="Phone number must be exactly 10 digits.">
    </div>
    <div class="form-group">
        <label for="username"><i class="fas fa-user-tag"></i> Username (Alphabets + Number)</label>
        <input type="text" id="username" name="username" required pattern="[A-Za-z0-9]+" title="Username should contain only alphanumeric characters.">
    </div>
    <div class="form-group">
        <label for="password"><i class="fas fa-lock"></i> Password (5-12 chars, Alphanumeric + Special)</label>
        <input type="password" id="password" name="password" required pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{5,12}" 
               title="Password must contain at least one lowercase letter, one uppercase letter, one number, and one special character, and be 5-12 characters long.">
    </div>
    <div class="form-group">
        <label for="address"><i class="fas fa-home"></i> Address</label>
        <input type="text" id="address" name="address" required>
    </div>
    <div class="form-group">
        <label for="city"><i class="fas fa-city"></i> City</label>
        <input type="text" id="city" name="city" required pattern="[A-Za-z\s]+" title="City should contain only letters and spaces.">
    </div>
    <div class="form-group">
        <label for="state"><i class="fas fa-map-marker-alt"></i> State</label>
        <input type="text" id="state" name="state" required pattern="[A-Za-z\s]+" title="State should contain only letters and spaces.">
    </div>
    
    <button type="submit" class="register-button">Register</button>
</form>

            <div class="extra-links">
                <a href="userlogin.jsp">Already have an account? Sign In</a><br>
            </div>
            <div class="extra-links">
                <a href="register">Want to Register as Farmer? Click Here</a>
            </div>
        </div>
        <!-- Image Section -->
    </div>
</div>

</body>
</html>