<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Admin Login</title>
        <%@ include file="demoheader.jsp" %>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
    background-image: url('https://www.ncctrainingresources.co.uk/wp-content/uploads/2017/10/69192366_m.png');
    background-size: cover;
    background-position: center;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: flex-end; /* Align the container to the right */
    align-items: center; /* Center the container vertically */
    height: 100vh;
}

.container {
    background-color: rgba(255, 255, 255, 0); /* More transparent background */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    max-width: 400px;
    width: 100%;
    padding: 40px;
    margin-right: 200px; /* Move the container a little left from the right edge */
}


        .login-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-form h1 {
            color: #705C53;
            margin-bottom: 20px;
            text-align: center;
        }

        .input-group {
            margin-bottom: 20px;
            width: 100%;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #B7B7B7;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #B7B7B7;
            border-radius: 4px;
        }

        .signin-button {
            background-color: #705C53;
            color: #FFFFFF;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        .signin-button:hover {
            background-color: #B7B7B7;
        }

        .forgot-link {
            margin-top: 20px;
            color: #705C53;
            text-decoration: none;
            text-align: center;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }

        .checklogin {
            font-weight: bold;
            color: red;
        }

        .error-message {
            color: red;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="login-form">
            <h1>Admin Login - FarmGo</h1>
            <p>Are You An <a href="login.jsp">Farmer</a> Login Here!!</p>
            <br>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <form method="post" action="/checkadminlogin">
                <div class="input-group">
                    <label for="admin-username">Admin Username</label>
                    <input type="text" id="admin-username" name="admin-username" required>
                </div>
                <div class="input-group">
                    <label for="admin-password">Admin Password</label>
                    <input type="password" id="admin-password" name="admin-password" required>
                </div>
                <button type="submit" class="signin-button">Sign In</button>
            </form><br><br>
            <a href="#">Reset Your Password?</a>
        </div>
    </div>
</body>
</html>
