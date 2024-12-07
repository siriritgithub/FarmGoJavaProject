<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5F7;
            box-sizing: border-box;
        }

        h3 {
            text-align: center;
            color: #705C53;
            margin: 20px 0;
            font-size: 28px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .search-bar {
            width: 100%;
            max-width: 800px;
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .search-bar input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
        }

      .product-box {
    width: calc(40% - 20px); /* Increase width for larger boxes */
    max-width: 500px; /* Allow a larger maximum width */
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    overflow: hidden;
    cursor: pointer;
    text-decoration: none;
    padding: 15px;
    transition: box-shadow 0.3s ease;
}

        .product-box:hover {
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

       .product-image {
    width: 100%;
    height: 250px; /* Increased height */
    object-fit: contain; /* Ensures the entire image fits */
    border-radius: 5px;
}

        .product-name {
            font-weight: bold;
            color: #705C53;
            margin: 10px 0;
            font-size: 20px;
        }

        .product-price {
            color: #705C53;
            margin: 5px 0;
            font-size: 18px;
        }

        .product-type {
            color: #705C53;
            margin: 5px 0;
        }

        .buy-now {
            padding: 10px 20px;
            background-color: #705C53;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
            margin-top: 10px;
        }

        .buy-now:hover {
            background-color: #B7B7B7;
        }

    @media (max-width: 768px) {
    .product-box {
        width: calc(48% - 20px); /* Adjust for medium screens */
    }
}

@media (max-width: 480px) {
    .product-box {
        width: 100%; /* Full-width for small screens */
    }
}

        }
    </style>
</head>

<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
        <h3>Products by Farmer</h3>

        <!-- Search bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by product name...">
        </div>

        <!-- Check if products are available -->
        <c:if test="${empty productList}">
            <p>No products found for this farmer.</p>
        </c:if>

        <!-- Display the product list -->
        <c:if test="${not empty productList}">
            <div class="product-container" id="farmerTable">
                <c:forEach items="${productList}" var="product">
                    <div class="product-box">
                        <c:choose>
                            <c:when test="${not empty product.image}">
                                <img src="displayprodimage?id=${product.id}" alt="${product.name}" class="product-image">
                            </c:when>
                            <c:otherwise>No Image</c:otherwise>
                        </c:choose>

                        <div class="product-name"><c:out value="${product.name}"></c:out></div>
                        <div class="product-type"><c:out value="${product.type}"></c:out></div>
                        <div class="product-price">₹<c:out value="${product.price}"></c:out></div>

                        <!-- Buy Now Button inside the product box -->
                        <div>
                          <button class="buy-now-btn" onclick="window.location.href='buyProduct?id=${product.id}'">Buy Now</button>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

    <script>
        function filterTable() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toUpperCase();
            const productContainer = document.getElementById('farmerTable');
            const productBoxes = productContainer.getElementsByClassName('product-box');

            for (let i = 0; i < productBoxes.length; i++) {
                const productBox = productBoxes[i];
                const productName = productBox.getElementsByClassName('product-name')[0];

                if (productName) {
                    const txtValue = productName.textContent || productName.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        productBox.style.display = '';
                    } else {
                        productBox.style.display = 'none';
                    }
                }
            }
        }
    </script>
</body>

</html>
