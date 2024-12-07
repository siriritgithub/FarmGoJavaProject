<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Farmer | Update Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #808000;
        }

        .content-container {
            margin-left: 250px; /* Adjust this to match the width of your navbar */
            align-items: center;
            padding: 20px;
        }

        .table-container {
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color: white; /* Added a background color to the table container */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #808000;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Even rows have a light background for stripes */
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .update-button {
            padding: 5px 10px;
            background-color: #705C53;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .update-button:hover {
            background-color: #B7B7B7;
        }

        /* Popup Form */
        .popup-form {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
            background-color: white;
            width: 600px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 5;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input, .form-group select {
            width: 90%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .close-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function showPopup(id, name, type, date, price, location, contact, specification, quantity, farmerId) {
            document.getElementById("popup-form").style.display = "block";
            document.getElementById("popup-overlay").style.display = "block";

            document.getElementById("id").value = id;
            document.getElementById("name").value = name;
            document.getElementById("type").value = type;
            document.getElementById("date").value = date;
            document.getElementById("price").value = price;
            document.getElementById("location").value = location;
            document.getElementById("contact").value = contact;
            document.getElementById("specification").value = specification;
            document.getElementById("quantity").value = quantity; // Set quantity in the form
            document.getElementById("farmerId").value = farmerId;
        }

        function closePopup() {
            document.getElementById("popup-form").style.display = "none";
            document.getElementById("popup-overlay").style.display = "none";
        }
    </script>
</head>
<body>
<%@ include file="farmernavbar.jsp" %>
<div class="content-container">
    <div class="table-container">
        <h2>Update Products</h2>
        <c:if test="${not empty message}">
            <div id="notification" 
                 style="padding: 10px; background-color: #dff0d8; color: #3c763d; 
                        border: 1px solid #d6e9c6; border-radius: 5px; margin-bottom: 20px; 
                        opacity: 1; transition: opacity 1s ease;">
                ${message}
            </div>
            <script>
                setTimeout(function() {
                    var notification = document.getElementById("notification");
                    if (notification) {
                        notification.style.opacity = "0"; 
                        setTimeout(function() {
                            notification.style.display = "none"; 
                        }, 1000); 
                    }
                }, 3000);
            </script>
        </c:if>

        <c:if test="${not empty products}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Contact</th>
                        <th>Specification</th>
                        <th>Quantity</th> <!-- New Quantity Column -->
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td><c:out value="${product.id}" /></td>
                            <td><c:out value="${product.name}" /></td>
                            <td><c:out value="${product.type}" /></td>
                            <td><c:out value="${product.date}" /></td>
                            <td><c:out value="${product.price}" /></td>
                            <td><c:out value="${product.location}" /></td>
                            <td><c:out value="${product.contact}" /></td>
                            <td><c:out value="${product.specification}" /></td>
                            <td><c:out value="${product.quantity}" /></td> <!-- Display Quantity -->
                            <td>
                                <button class="update-button" onclick="showPopup(
                                    '${product.id}', '${product.name}', '${product.type}', '${product.date}', 
                                    '${product.price}', '${product.location}', '${product.contact}', 
                                    '${product.specification}', '${product.quantity}', '${product.farmerId}'
                                )">Update</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty products}">
            <p>No products available to display.</p>
        </c:if>
    </div>
</div>

<!-- Popup Form -->
<div class="popup-overlay" id="popup-overlay" onclick="closePopup()"></div>
<div class="popup-form" id="popup-form">
    <form action="updateproduct" method="post">
        <input type="hidden" id="id" name="id">
        <input type="hidden" id="farmerId" name="farmerId">
        <div class="form-group">
            <label for="name">Product Name</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="type">Type</label>
            <input type="text" id="type" name="type" required>
        </div>
        <div class="form-group">
            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" required>
        </div>
        <div class="form-group">
            <label for="contact">Contact</label>
            <input type="tel" id="contact" name="contact" required>
        </div>
        <div class="form-group">
            <label for="specification">Specification</label>
            <select id="specification" name="specification" required>
                <option value="vegetables">Vegetables</option>
                <option value="dairy_products">Dairy Products</option>
                <option value="organic_waste">Organic Waste</option>
            </select>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" required> <!-- Add Quantity input -->
        </div>
        <button type="submit" class="update-button">Update Product</button>
        <button type="button" class="close-button" onclick="closePopup()">Close</button>
    </form>
</div>
</body>
</html>
