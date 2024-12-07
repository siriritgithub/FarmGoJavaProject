<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADMIN | ADD PRODUCT</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .main-content {
            margin-left: 250px; /* Ensure it aligns with the sidebar */
            padding: 20px;
        }

        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            color: #705C53;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
            font-size: 14px;
	        }
	        .form-group select {
	    width: 100%; /* Ensure the select box takes full width */
	    padding: 10px; /* Match padding of other input fields */
	    border: 1px solid #ddd; /* Same border style */
	    border-radius: 5px; /* Same border radius */
	    font-size: 14px; /* Same font size */
	}

        .form-group input {
            width: 96%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #705C53;
        }

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #705C53;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #B7B7B7;
        }
           .error-message {
    color: red;
}
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
  <div class="main-content">
    <div class="form-container">
        <h1>Add Product</h1>
        <div class="checklogin">
            <c:if test="${not empty message}">
                <p class="error-message"><c:out value="${message}" /></p>
            </c:if>
        </div>
        <form action="adminaddproduct" method="post">
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="type">Name of the Variety</label>
                <input type="text" id="type" name="type" required>
            </div>
            <div class="form-group">
                <label for="type">Date of harvest/picking/collecting</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="price">Product Price</label>
                <input type="number" id="price" name="price" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="location">Producer Location</label>
                <input type="text" id="location" name="location" required>
            </div>
            <div class="form-group">
                <label for="contact">Producer Contact</label>
                <input type="tel" id="contact" name="contact" required>
            </div>
            <div class="form-group">
                <label for="specification">Product Specification</label>
                <select id="specification" name="specification" required>
                    <option value="vegetables">Vegetables</option>
                    <option value="dairy_products">Dairy Products</option>
                    <option value="organic_waste">Organic Waste</option>
                </select>
            </div>
             <div class="form-group">
                    <label for="image">Image-URL</label>
                    <input type="text" id="image" name="image" required>
                </div>
            <div class="form-group">
                <button type="submit" class="submit-button">Add Product</button>
            </div>
        </form>
    </div>
    </div>
</body>
</html>
