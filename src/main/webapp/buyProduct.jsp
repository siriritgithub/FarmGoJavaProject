<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="usernavbar.jsp" %>
    <title>${product.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .product-detail {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px; /* Reduced container size */
            margin: auto;
        }
        .product-detail h1 {
            font-size: 22px;
            color: #333;
        }
        .product-detail p {
            font-size: 14px;
            color: #555;
        }
        .product-detail a {
            text-decoration: none;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .product-detail a:hover {
            background-color: #218838;
        }
        .product-detail input {
            padding: 8px;
            margin-top: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .total-price {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="product-detail">
       
        <c:choose>
            <c:when test="${not empty product.image}">
                <img src="displayprodimage?id=${product.id}" alt="${product.name}" style="max-width: 100%; height: auto;">
            </c:when>
            <c:otherwise>No Image Available</c:otherwise>
        </c:choose>
        
        <h1>${product.name}</h1>
        <p><strong>Type:</strong> ${product.type}</p>
        <p><strong>Price:</strong> ₹${product.price} </p>
        
        <!-- Display price unit based on product specification -->
        <c:choose>
            <c:when test="${product.specification == 'Vegetables & Fruits'}">
                <p><strong>Price per:</strong> kg</p>
            </c:when>
            <c:when test="${product.specification == 'Dairy Products'}">
                <p><strong>Price per:</strong> liter</p>
            </c:when>
            <c:when test="${product.specification == 'Value-added Products'}">
                <p><strong>Price per:</strong> item</p>
            </c:when>
            <c:otherwise>
                <p><strong>Price per:</strong> unit</p> <!-- Default price unit -->
            </c:otherwise>
        </c:choose>

        <form action="/payment" method="GET">
            <label for="quantity">How much quantity do you want?</label>
            <input type="number" id="quantity" name="quantity" min="1" max="${product.quantity}" value="1" onchange="updateTotal()">
            
            <p class="total-price">Total: ₹<span id="totalPrice">${product.price}</span></p>
            
            <p>Available Quantity: ${product.quantity}</p>
            <p>Remaining Quantity: <span id="remainingQuantity">${product.quantity - 1}</span></p>
            
            <!-- Changed to productId -->
            <input type="hidden" name="productId" value="${product.id}">
            <input type="hidden" name="productName" value="${product.name}">
            <input type="hidden" name="price" value="${product.price}">
            <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="${product.price}">
            <input type="hidden" name="farmerId" value="${product.farmerId}">
            
            <button type="submit" style="background-color: #007bff; border: none; color: white; padding: 10px 20px; margin-top: 10px; border-radius: 5px;">Proceed to Checkout</button>
        </form>
    </div>

    <script>
        // Update the total price and remaining quantity
        function updateTotal() {
            var price = ${product.price};
            var quantity = document.getElementById("quantity").value;
            
            // Update total price
            var total = price * quantity;
            document.getElementById("totalPrice").innerText = total;
            
            // Update remaining quantity
            var remaining = ${product.quantity} - quantity;
            document.getElementById("remainingQuantity").innerText = remaining;
        }
    </script>

</body>
</html>
