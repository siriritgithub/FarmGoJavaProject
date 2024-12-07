<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Farmer | Delete Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #808000;
        }

        .content-container {
            margin-left: 250px; /* Adjust this to match the width of your navbar */
            padding: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 250px;
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .card p {
            margin: 5px 0;
            font-size: 14px;
        }

        .card .delete-button {
            padding: 8px 16px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .card .delete-button:hover {
            background-color: #ff6666;
        }

        /* Notification styling */
        #notification {
            padding: 10px;
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
            border-radius: 5px;
            margin-bottom: 20px;
            opacity: 1;
            transition: opacity 1s ease;
        }
    </style>
    <script>
        function confirmDelete(productId, productName) {
            if (confirm("Are you sure you want to delete the product: " + productName + "?")) {
                window.location.href = 'deleteproduct?id=' + productId;
            }
        }

        // Automatically hide the notification after 3 seconds with a smooth transition
        setTimeout(function() {
            var notification = document.getElementById("notification");
            if (notification) {
                notification.style.opacity = "0"; // Start the fade-out transition
                setTimeout(function() {
                    notification.style.display = "none"; // Hide completely after transition ends
                }, 1000); // Wait for the transition duration (1 second)
            }
        }, 3000); // Show the notification for 3 seconds
    </script>
</head>
<body>
<%@ include file="farmernavbar.jsp" %>
<div class="content-container">
    <div class="card-container">
        <h2>Delete Products</h2>
        <br>
        

        <c:if test="${not empty message}">
            <div id="notification">${message}</div>
        </c:if>

        <c:if test="${not empty products}">
            <c:forEach items="${products}" var="product">
                <div class="card">
                    <h3>${product.name}</h3>
                    <p><strong>ID:</strong> <c:out value="${product.id}" /></p>
                    <p><strong>Type:</strong> <c:out value="${product.type}" /></p>
                    <p><strong>Date:</strong> <c:out value="${product.date}" /></p>
                    <p><strong>Price:</strong> <c:out value="${product.price}" /></p>
                    <p><strong>City:</strong> <c:out value="${product.city}" /></p>
                    <p><strong>State:</strong> <c:out value="${product.state}" /></p>
                    <p><strong>Contact:</strong> <c:out value="${product.contact}" /></p>
                    <p><strong>Specification:</strong> <c:out value="${product.specification}" /></p>
                    <p><strong>Quantity:</strong> <c:out value="${product.quantity}" /></p>
                    <button class="delete-button" onclick="confirmDelete('${product.id}', '${product.name}')">
                        Delete
                    </button>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty products}">
            <p>No products available to display.</p>
        </c:if>
    </div>
</div>
</body>
</html>
