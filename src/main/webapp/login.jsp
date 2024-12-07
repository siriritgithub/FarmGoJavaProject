<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX | Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Style Variables */
        :root {
            --light-gray: #f4f4f9;
            --white: #ffffff;
            --primary-blue: #4C8BFB;
            --secondary-blue: #705C53;
            --light-pink: #F8D7D7;
            --gray: #A9A9A9;
            --dark-gray: #4F4F4F;
            --input-background: #F8D7D7;
            --button-hover-background: #A9A9A9;
            --input-border-color: #A9A9A9;
            --input-focus-border-color: #4C8BFB;
            --input-placeholder-color: #705C53;
        }

        /* Global Styles */
        body {
            font-family: 'Georgia', serif;
            background-color: var(--light-gray);
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .login-page {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 1000px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        /* Left Section */
        .left-section {
            flex: 1;
            position: relative;
            height: 100%;
        }

        .left-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 12px 0 0 12px;
        }

        /* Right Section */
        .right-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .right-section h1 {
            font-size: 32px;
            font-weight: 700;
            color: var(--primary-blue);
            margin-bottom: 20px;
        }

        .right-section p {
            font-size: 16px;
            color: var(--gray);
            margin-bottom: 30px;
        }

        .checklogin p.error-message {
            color: #d9534f;
            font-size: 14px;
            margin: 10px 0;
        }

        /* Form Styles */
        form {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            margin-bottom: 15px;
            border: 1px solid var(--input-border-color);
            border-radius: 8px;
            background-color: var(--input-background);
            color: var(--secondary-blue);
        }

        input:focus {
            border-color: var(--input-focus-border-color);
            outline: none;
        }

        /* Forgot Password Link */
        .forgot-password {
            font-size: 14px;
            color: var(--primary-blue);
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        /* Button Styles */
        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            background-color: var(--primary-blue);
            color: var(--white);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: var(--button-hover-background);
        }

        /* Sign-Up Link */
        .signup-link p {
            font-size: 14px;
            color: var(--primary-blue);
        }

        .signup-link a {
            font-weight: bold;
            color: var(--primary-blue);
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                padding: 10px;
            }

            .left-section {
                width: 100%;
                height: 300px;
                border-radius: 12px 12px 0 0;
            }

            .left-section img {
                width: 100%;
                height: 100%;
                border-radius: 12px;
            }

            .right-section {
                padding: 20px;
                width: 100%;
            }
        }
    </style>
</head>
<%@ include file="demoheader.jsp" %>
<body>


<div class="login-page">
    <div class="container">
        <!-- Left Section: Image -->
        <div class="left-section">
            <img src="https://th.bing.com/th/id/OIG3.Qc.xFK2bC7OrW.V0cQno?w=270&h=270&c=6&r=0&o=5&dpr=1.5&pid=ImgGn" alt="Farming Management">
        </div>

        <!-- Right Section: Login Form -->
        <div class="right-section">
            <h1>Welcome Back! Dear Farmer</h1>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <p>Are You An <a href="adminlogin.jsp">Admin</a>? Login Here!</p>
            <p>Login to manage your farming operations with PRO'FX</p>
            <form action="loginAction" method="POST">
                <input type="text" name="username" placeholder="Your username" required>
                <input type="password" name="password" placeholder="Your Password" required>
                <a href="forgetpassword" class="forgot-password">Forgot password?</a><br><br>
                <button type="submit">Log In</button>
            </form>
            <div class="signup-link">
                <p>Don't have an account? <a href="register">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>