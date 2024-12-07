<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FARMER | VIEW ALL USERS</title>
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
    }

    .main-content {
        margin-left: 250px; /* Matches navbar width */
        padding: 20px;
    }

    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
        padding: 20px;
        border-radius: 10px;
    }

    .card {
        background-color: #FFFFFF;
        width: 250px;
        padding: 20px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        border-radius: 8px;
        text-align: center;
        color: #705C53;
        border: 2px solid #705C53; /* Border for each card */
    }

    .card img {
        width: 100px; /* Image width */
        height: 100px; /* Image height */
        border-radius: 50%; /* Makes the image round */
        margin-bottom: 10px;
    }

    .card h4 {
        color: #705C53;
        font-size: 18px;
        margin-bottom: 10px;
    }

    .card p {
        color: #705C53;
        margin: 5px 0;
    }

    .card a {
        text-decoration: none;
        color: #fff;
        background-color: #705C53; /* Button color */
        font-weight: bold;
        margin-top: 10px;
        padding: 10px 20px;
        display: inline-block;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .card a:hover {
        background-color: #B7B7B7; /* Hover effect for button */
    }

    .card:hover {
        background-color: #EDDDE0; /* Light background on hover */
    }


 .view-all-title {
        text-align: center;
        color: #705C53; /* Heading color */
        font-size: 32px; /* Bigger font size */
        font-weight: bold; /* Bold text */
        margin-top: 30px; /* More space from top */
        margin-bottom: 20px; /* Space below the heading */
        padding: 10px 0; /* Padding around the text */
        border-bottom: 2px solid #705C53; /* Adds a line below the heading */
        width: 300px; /* Controls the width of the heading */
        margin-left: auto;
        margin-right: auto; /* Centers the heading */
    }
</style>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
       <h3 class="view-all-title">View All Farmers</h3>

        <div class="card-container">
            <c:forEach items="${farmerslist}" var="farmer" varStatus="status">
                <div class="card">
                    <!-- Image for each farmer -->
                    <img src="https://icons.iconarchive.com/icons/google/noto-emoji-people-profession/1024/10254-man-farmer-icon.png" alt="Farmer Image">
                    <h4>Farmer ${status.index + 1}</h4>
                    <p><strong>Name:</strong> <c:out value="${farmer.name}" /></p>
                    <p><strong>Phone:</strong> <c:out value="${farmer.phone}" /></p>
                    <p><strong>Address:</strong> <c:out value="${farmer.address}" /></p>
                    <p><strong>State:</strong> <c:out value="${farmer.state}" /></p>
                    <a href="/products?farmerId=${farmer.id}">View Products</a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
