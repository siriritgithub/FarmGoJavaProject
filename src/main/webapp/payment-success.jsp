<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="usernavbar.jsp" %>
    <title>Payment Success - ${product.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .success-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin: auto;
        }
        .success-container h1 {
            font-size: 24px;
            color: #333;
            text-align: center;
        }
        .success-message {
            font-size: 18px;
            color: #28a745;
            text-align: center;
            margin-top: 20px;
        }
        .order-details {
            margin-top: 30px;
        }
        .order-details p {
            font-size: 16px;
            color: #555;
        }
        .btn-back {
            display: block;
            width: 100%;
            text-align: center;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h1>Payment Successful!</h1>
        
        <div class="success-message">
            <p>Your payment was successful. Thank you for your purchase!</p>
        </div>

        <div class="order-details">
            <p><strong>Product Name:</strong> ${product.name}</p>
            <p><strong>Price:</strong> ₹${product.price}</p>
            <p><strong>Payment Method:</strong> ${paymentMethod}</p>
            <p><strong>Transaction ID:</strong> ${transactionId}</p>
        </div>

        <button class="btn-back" onclick="window.location.href='/home'">Back to Home</button>
    </div>
</body>
</html>
