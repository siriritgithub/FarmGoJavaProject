<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="usernavbar.jsp" %>
    <title>Checkout - ${product.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .checkout-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin: auto;
        }
        .checkout-container h1 {
            font-size: 22px;
            color: #333;
        }
        .checkout-container img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .product-info p {
            font-size: 14px;
            color: #555;
        }
        .payment-options {
            margin-top: 20px;
        }
        .payment-button {
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            display: inline-block;
            width: 100%;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .payment-button:hover {
            opacity: 0.8;
        }
        .btn-debit-card {
            background-color: #28a745;
            color: white;
        }
        .btn-upi {
            background-color: #007bff;
            color: white;
        }
        .btn-scanner {
            background-color: #ffc107;
            color: black;
        }
        .payment-method-options {
            display: none;
            margin-top: 10px;
        }
        .payment-form input[type="text"], .payment-form input[type="number"], .payment-form select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .payment-form label {
            font-weight: bold;
            color: #333;
        }
        #scannerImage {
            display: none;
            width: 150px;
            height: 150px;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h1>Checkout</h1>
        
        <!-- Product Information -->
        <div class="product-info">
            <c:choose>
                <c:when test="${not empty product.image}">
                    <img src="displayprodimage?id=${product.id}" alt="${product.name}">
                </c:when>
                <c:otherwise>No Image Available</c:otherwise>
            </c:choose>
            
            <p><strong>Product Name:</strong> ${product.name}</p>
            <p><strong>Price:</strong> ₹${product.price}</p>
            <p><strong>Total:</strong> ₹<span id="totalPrice">${product.price}</span></p>
        </div>

        <!-- Payment Options -->
        <div class="payment-options">
            <form action="/process-payment" method="POST" onsubmit="redirectToSuccess(event)">
                <input type="hidden" name="productId" value="${product.id}">
                <input type="hidden" name="productName" value="${product.name}">
                <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="${product.price}">

                <!-- Debit Card Option -->
                <button type="button" class="payment-button btn-debit-card" onclick="showDebitCardForm()">
                    Pay with Debit Card
                </button>
                <div id="debitCardForm" class="payment-method-options payment-form">
                    <label for="cardNumber">Card Number</label>
                    <input type="number" id="cardNumber" name="cardNumber" placeholder="Enter card number" required>

                    <label for="expiryDate">Expiry Date</label>
                    <div style="display: flex;">
                        <input type="number" id="expiryMonth" name="expiryMonth" placeholder="MM" style="width: 50%;" required>
                        <input type="number" id="expiryYear" name="expiryYear" placeholder="YY" style="width: 50%;" required>
                    </div>

                    <label for="cvv">CVV</label>
                    <input type="number" id="cvv" name="cvv" placeholder="Enter CVV" required>
                </div>
                
                <!-- UPI Option -->
                <button type="button" class="payment-button btn-upi" onclick="showUPIForm()">
                    Pay with UPI
                </button>
                <div id="upiForm" class="payment-method-options payment-form">
                    <label for="upiId">Enter UPI ID:</label>
                    <input type="text" id="upiId" name="upiId" placeholder="UPI ID" required>
                </div>
                
                <!-- Scanner Option -->
                <button type="button" class="payment-button btn-scanner" onclick="showScanner()">
                    Pay with Scanner (QR Code)
                </button>
                <div id="scannerImage" class="payment-method-options">
                    <img src="https://th.bing.com/th/id/OIP.4mW76GLGoQ3urnPnddjrpAAAAA?w=175&h=175&rs=1&pid=ImgDetMain" alt="Scan QR Code">
                </div>

                <!-- Submit Payment -->
               <button type="button" class="payment-button btn-debit-card" onclick="redirectToSuccess()">
    Submit Payment
</button>

                   
            </form>
        </div>
    </div>

    <script>
        // Show Debit Card Form
        function showDebitCardForm() {
            document.getElementById('debitCardForm').style.display = 'block';
            document.getElementById('upiForm').style.display = 'none';
            document.getElementById('scannerImage').style.display = 'none';
        }

        // Show UPI Form
        function showUPIForm() {
            document.getElementById('upiForm').style.display = 'block';
            document.getElementById('debitCardForm').style.display = 'none';
            document.getElementById('scannerImage').style.display = 'none';
        }

        // Show Scanner Image
        function showScanner() {
            document.getElementById('scannerImage').style.display = 'block';
            document.getElementById('debitCardForm').style.display = 'none';
            document.getElementById('upiForm').style.display = 'none';
        }
        
        function redirectToSuccess(event) {
            event.preventDefault(); // Prevent default form submission
            // Simulate backend processing
            setTimeout(() => {
                window.location.href = '/payment-success'; // Redirect to Payment Success page
            }, 1000); // Simulated delay for user experience
        }

    </script>
</body>
</html>
