<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <style>
        /* General Page Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #F5F5F7; /* Light Gray */
            color: #333333; /* Dark Gray */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header Styles */
        header {
            background-color: #4CAF50; /* Success Green */
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 100;
        }

        /* Main Content Styles */
        .main-content {
            margin-top: 80px; /* Space for the fixed header */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        /* Registration Success Container */
        .container {
            text-align: center;
            background-color: #FFFFFF; /* White */
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
        }

        /* Heading Styles */
        h1 {
            font-size: 24px;
            color: #4CAF50; /* Success Green */
            margin-bottom: 20px;
        }

        /* Paragraph Styles */
        p {
            font-size: 18px;
            color: #555555; /* Medium Gray */
            margin-bottom: 30px;
        }

        /* Link Styles */
        button {
            display: inline-block;
            text-decoration: none;
           background-color : green; 
            color: #FFFFFF; /* White */
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #45A049; /* Darker Green */
        }
    </style>
</head>
<body>
	<%@ include file="demoheader.jsp" %>
  
    <div class="main-content">
        <div class="container">
            <h1>Registration Status</h1>
            <p><c:out value="${message}" /></p>
            <p>Thank you for registering!</p>
            <a class = " button" href="login.jsp">Click here to login</a>
        </div>
    </div>
</body>
</html>
