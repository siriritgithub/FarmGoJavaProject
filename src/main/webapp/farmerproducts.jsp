<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ include file="farmernavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Products</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            background-color: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0);
            padding: 20px;
            max-width: 1200px;
            background-color: rgba(237, 221, 224, 0); /* Semi-transparent overlay */
        }

        h2 {
            text-align: center;
            color: #705C53;
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 20px;
        }

        /* Card layout container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .card {
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            display: flex;
            width: 45%; /* Two cards per row */
            max-width: 600px;
            transition: transform 0.3s;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 40%;
            height: auto;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .card h3 {
            color: #4CAF50;
            margin: 0 0 10px;
            font-size: 20px;
        }

        .card p {
            color: #333;
            margin: 5px 0;
            font-size: 14px;
        }

        .card .date {
            font-size: 12px;
            color: #888;
            margin-top: 10px;
        }

        .card .state {
            font-weight: bold;
            color: #705C53;
            margin-top: 10px;
        }

        .message {
            text-align: center;
            font-size: 18px;
            color: #333;
        }

        .main-content {
            margin-top: 60px; /* Adjust for fixed navbar height */
        }

        /* Style for the search input */
        #myInput {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Products</h2>
        
        <!-- Search Input -->
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for product names...">

        <c:if test="${empty products}">
            <p class="message">No products found.</p>
        </c:if>
        
        <c:if test="${not empty products}">
            <div class="card-container">
                <c:forEach var="product" items="${products}">
                    <div class="card" class="product-row">
                        <!-- Image Section -->
                        <c:choose>
                            <c:when test="${not empty product.image}">
                                <!-- Display image using the 'displayprodimage' URL -->
                                <img src="displayprodimage?id=${product.id}" alt="${product.name}" />
                            </c:when>
                            <c:otherwise>
                                <!-- Default image when no product image is available -->
                                <img src="images/default-image.jpg" alt="Default Image" />
                            </c:otherwise>
                        </c:choose>

                        <!-- Product Details Section -->
                        <div class="card-content">
                            <h3>${product.name}</h3>
                            <p><strong>Type:</strong> ${product.type}</p>
                            <p><strong>Price:</strong> ${product.price}</p>
                            <p><strong>Quantity:</strong> ${product.quantity}</p>
                            <p><strong>Location:</strong> ${product.location}</p>
                            <p><strong>Specification:</strong> ${product.specification}</p>
                            <p class="date"><strong>Date:</strong> ${product.date}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

    <!-- JavaScript for Filtering Products -->
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementsByClassName("card-container")[0];
            tr = table.getElementsByClassName("card");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("h3")[0]; // Searching in the product name (h3 tag)
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</body>
</html>