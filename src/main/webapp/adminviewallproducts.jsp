<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN | VIEW ALL FARMERS</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #705C53;
            padding: 10px 20px;
            color: white;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
        }

        .navbar a:hover {
            background-color: #4e3b2a;
            border-radius: 5px;
        }

        .main-content {
            margin-left: 250px;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        h3 {
            text-align: center;
            color: #705C53;
            margin-bottom: 20px;
            font-size: 28px;
        }

        #searchInput {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #705C53;
            color: white;
        }

        td {
            color: #555;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        .product-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }

        .product-name {
            font-weight: bold;
            color: #4e3b2a;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            table {
                width: 100%;
            }
        }
    </style>
</head>

<body>

    <%@ include file="adminnavbar.jsp" %>

    <div class="main-content">
        <h3>View All Farmers</h3>

        <!-- Search Input -->
        <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by Farmer Name">

        <div class="table-container">
            <table id="farmerTable">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Specification</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Contact</th>
                        <th>Date</th>
                        <th>State</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${productslist}" var="product">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty product.image}">
<img src="displayprodimage?id=${product.id}" alt="${product.name}" class="product-image">                                    </c:when>
                                    <c:otherwise>No Image</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="product-name"><c:out value="${product.name}" /></td>
                            <td><c:out value="${product.specification}" /></td>
                            <td><c:out value="${product.type}" /></td>
                            <td><c:out value="${product.price}" /></td>
                            <td><c:out value="${product.contact}" /></td>
                            <td><c:out value="${product.date}" /></td>
                            <td><c:out value="${product.location}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function filterTable() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toUpperCase();
            const table = document.getElementById('farmerTable');
            const tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName('td')[1]; // Name column
                if (td) {
                    const txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = '';
                    } else {
                        tr[i].style.display = 'none';
                    }
                }
            }
        }
    </script>
</body>

</html>