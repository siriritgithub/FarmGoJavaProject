<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>USER | VIEW ALL PRODUCTS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5F7;
        }

        h3 {
            text-align: center;
            color: #705C53;
            margin-top: 20px;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        form {
            text-align: center;
            margin: 20px;
        }

        label {
            font-size: 14px;
            margin-right: 10px;
        }

        select {
            padding: 5px;
            font-size: 14px;
            width: 200px;
            margin-right: 10px;
        }

        button {
            padding: 6px 15px;
            font-size: 14px;
            background-color: #705C53;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #B7B7B7;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: #FFFFFF;
            border: 1px solid #B7B7B7;
            border-radius: 8px;
            width: 300px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #705C53;
            margin-bottom: 10px;
        }

        .card-details {
            font-size: 14px;
            color: #333;
            margin-bottom: 15px;
        }

        .popup {
            display: none;
            position: absolute;
            top: 0;
            left: 250px;
            width: calc(100% - 250px);
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            overflow: auto;
            z-index: 1000;
            animation: slideDown 0.5s ease-in-out;
        }

        @keyframes slideDown {
            from {
                top: -100%;
            }
            to {
                top: 0;
            }
        }

        .popup-content {
            padding: 20px;
            text-align: center;
        }

        .popup-content h3 {
            color: #705C53;
            margin-bottom: 20px;
        }

        .popup-content p {
            font-size: 16px;
            color: #333;
            margin: 10px 0;
        }

        .popup-content button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .popup-content button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
        <h3>View All Products</h3>
        <form action="/filterproducts" method="get">
            <label for="specification">Filter by Specification:</label>
            <select id="specification" name="specification" required>
                <option value="">SELECT SPECIFICATION</option>
                <option value="vegetables">Vegetables</option>
                <option value="dairy_products">Dairy Products</option>
                <option value="organic_waste">Organic Waste</option>
            </select>
            <button type="submit">Filter</button>
        </form>

        <div class="card-container">
            <c:forEach items="${productslist}" var="product">
                <div class="card">
                    <img src="${product.image}" alt="${product.name}">
                    <div class="card-content">
                        <div class="card-title"><c:out value="${product.name}" /></div>
                        <div class="card-details">
                            <p><b>Specification:</b> <c:out value="${product.specification}" /></p>
                            <p><b>Type:</b> <c:out value="${product.type}" /></p>
                            <p><b>Price:</b> <c:out value="${product.price}" /></p>
                            <p><b>Location:</b> <c:out value="${product.location}" /></p>
                        </div>
                        <button type="button" onclick="showPopup('${product.name}', '${product.specification}', '${product.type}', '${product.price}', '${product.location}')">View</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="popup" id="productPopup">
        <div class="popup-content">
            <h3 id="popupProductName"></h3>
            <p><b>Specification:</b> <span id="popupProductSpecification"></span></p>
            <p><b>Type:</b> <span id="popupProductType"></span></p>
            <p><b>Price:</b> <span id="popupProductPrice"></span></p>
            <p><b>Location:</b> <span id="popupProductLocation"></span></p>
            <button onclick="closePopup()">Go Back</button>
        </div>
    </div>

    <script>
        function showPopup(name, specification, type, price, location) {
            document.getElementById('popupProductName').textContent = name;
            document.getElementById('popupProductSpecification').textContent = specification;
            document.getElementById('popupProductType').textContent = type;
            document.getElementById('popupProductPrice').textContent = price;
            document.getElementById('popupProductLocation').textContent = location;
            document.getElementById('productPopup').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('productPopup').style.display = 'none';
            window.location.href = "/userbuyproducts"; // Navigate to the userbuyproducts page
        }
    </script>
</body>
</html>
