<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Sign In</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .signin-page {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin-top: 20px; /* Ensures no overlap with the header */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 60px); /* Subtract header height */
            padding: 20px;
        }

        .signin-page .container {
            display: flex;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }

        .signin-page .form-container {
            padding: 40px;
            flex: 1;
        }

        .signin-page .form-container h2 {
            margin-bottom: 20px;
            color: #705C53;
        }

        .signin-page .form-group {
            margin-bottom: 20px;
        }

        .signin-page .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #B7B7B7;
        }

        .signin-page .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #B7B7B7;
            border-radius: 5px;
        }

        .signin-page .form-group input:focus {
            outline: none;
            border-color: #705C53;
        }

        .signin-page .form-group input::placeholder {
            color: #B7B7B7;
            opacity: 0.8;
        }

        .signin-page .signin-button {
            width: 100%;
            padding: 10px;
            background-color: #705C53;
            border: none;
            border-radius: 5px;
            color: #FFFFFF;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .signin-page .signin-button:hover {
            background-color: #B7B7B7;
        }

        .signin-page .forgot-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #705C53;
            text-decoration: none;
        }

        .signin-page .forgot-link:hover {
            text-decoration: underline;
        }

        .signin-page .image-container {
            flex: 1;
            background: url('https://th.bing.com/th/id/OIP.TXTYvhDReBiyOYLXvvFdwgHaD4?rs=1&pid=ImgDetMain') no-repeat center center;
            background-size: cover;
        }

        @media (max-width: 768px) {
            .signin-page .container {
                flex-direction: column;
            }
        }

        .signin-page .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <div class="signin-page">
        <div class="container">
            <div class="form-container">
                <h2>Sign In</h2>
                <p>Are You An <a href="adminlogin.jsp">Admin</a> Login Here!!</p>

                <div class="checklogin">
                    <c:if test="${not empty message}">
                        <p class="error-message"><c:out value="${message}" /></p>
                    </c:if>
                </div>

                <form action="/checkuserlogin" method="POST">
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username</label>
                        <input type="text" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                    <button type="submit" class="signin-button">Sign In</button>
                </form>
                <a href="/user/forgetpassword" class="forgot-link">Forgot Your Password?</a>
                 <a href="login" class="forgot-link"> Want to login as Farmer?</a>
                <p>Don't have an account? <a href="userregister">Sign Up</a></p>
                
            </div>
            <div class="image-container"></div>
        </div>
    </div>
</body>
</html>