<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>
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
        background-color: #F5F5F7; /* Light background */
    }

    h3 {
        text-align: center;
        color: #705C53; /* Heading color */
        margin-top: 20px;
        font-size: 24px; /* Larger heading */
    }

    .main-content {
        margin-left: 250px; /* Matches navbar width */
        padding: 20px;
    }

    .search-bar {
        text-align: center;
        margin: 20px 0;
    }

    .search-bar input[type="text"] {
        width: 50%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .product-container {
        display: flex;
        align-items: flex-start;
        gap: 20px;
        background: #fff;
        border: 1px solid #B7B7B7;
        border-radius: 8px;
        padding: 20px;
        margin: 15px auto;
        width: 60%;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .product-image {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
        border: 1px solid #ddd;
    }

    .product-details {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .product-details span {
        font-size: 18px;
        color: #705C53;
    }

    .product-details span strong {
        color: #333;
    }

    .product-container:hover {
        background-color: #EDDDE0;
    }

    /* Button styling */
    .buy-now-btn {
        background-color: #4CAF50; /* Green */
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
        transition: background-color 0.3s;
    }

    .buy-now-btn:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
        <h3>View All Products</h3>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search for products..." onkeyup="filterTable()" />
        </div>

        <!-- Products List -->
        <div id="farmerTable">
            <c:forEach items="${productslist}" var="product">
                <div class="product-container product-box">
                    <c:choose>
                        <c:when test="${not empty product.image}">
                            <img src="displayprodimage?id=${product.id}" alt="${product.name}" class="product-image">
                        </c:when>
                        <c:otherwise>
                            <img src="placeholder.jpg" alt="No Image" class="product-image">
                        </c:otherwise>
                    </c:choose>
                   <div class="product-details">
                        <span class="product-name"><strong>Name:</strong> <c:out value="${product.name}"/></span>
                        <span><strong>Specification:</strong> <c:out value="${product.specification}"/></span>
                        <span><strong>Type:</strong> <c:out value="${product.type}"/></span>
                        <span><strong>Price:</strong> ₹<c:out value="${product.price}"/></span>
                        <span><strong>City:</strong> <c:out value="${product.city}"/></span>
                        <span><strong>State:</strong> <c:out value="${product.state}"/></span>
                        <span><strong>Contact:</strong> <c:out value="${product.contact}"/></span>
                        <span><strong>Date:</strong> <c:out value="${product.date}"/></span>
                        <!-- Buy Now Button -->
                        <button class="buy-now-btn" onclick="window.location.href='buyProduct?id=${product.id}'">Buy Now</button>
                   </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- JavaScript for Filtering -->
   <script>
    function filterTable() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toUpperCase();
        const productContainer = document.getElementById('farmerTable');
        const productBoxes = productContainer.getElementsByClassName('product-box');

        for (let i = 0; i < productBoxes.length; i++) {
            const productBox = productBoxes[i];
            const productNameElement = productBox.querySelector('.product-name'); // Look for the product-name class

            if (productNameElement) {
                const txtValue = productNameElement.textContent || productNameElement.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    productBox.style.display = '';  // Show the product box
                } else {
                    productBox.style.display = 'none';  // Hide the product box
                }
            }
        }
    }
</script>

</body>
</html>
