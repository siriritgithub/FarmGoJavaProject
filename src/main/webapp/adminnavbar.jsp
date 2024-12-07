<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Sidebar</title>
    <!-- Font Awesome Link -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            background-image: url('https://t3.ftcdn.net/jpg/04/79/39/20/360_F_479392057_5vPDTsO4lQJ0Vl2V39BhUgZFDgmBePrJ.jpg'); /* Background image */
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
        }

        /* Sidebar styling */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #808000;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s;
            margin-bottom: 5px;
        }

        .sidebar a i {
            margin-right: 15px;
            font-size: 18px;
        }

        .sidebar a:hover {
            background-color: #B7B7B7;
        }

        /* Main content area */
        .main-content {
            margin-left: 250px; /* Match the sidebar width */
            padding: 20px;
        }

        /* Header Styling */
        .sidebar h2 {
            text-align: center;
            color: white;
            font-size: 22px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="adminhome"><i class="fas fa-home"></i>Home</a>
        <a href="addfarmer.jsp"><i class="fas fa-user-plus"></i>Add Farmers</a>
        <a href="adminapprovefarmers"><i class="fas fa-check-circle"></i>Approve Farmers</a>
        <a href="adminviewallfarmers"><i class="fas fa-users"></i>View All Farmers</a>
        <a href="adminviewallusers"><i class="fas fa-users"></i>View All Users</a>
        <a href="adminviewallproducts"><i class="fas fa-box"></i>View All Products</a>
        <a href="#"><i class="fas fa-chart-line"></i>View Income(Dummy)</a>
        <a href="/home"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>
</body>
</html>
