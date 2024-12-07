<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Sidebar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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

        .sidebar a:hover {
            background-color: #B7B7B7;
        }

        .sidebar a i {
            margin-right: 15px; /* Spacing between icon and text */
            font-size: 20px;
        }

        /* Header Styling */
        .sidebar h2 {
            text-align: center;
            color: white;
            font-size: 22px;
            margin-bottom: 20px;
        }

        /* Main content area */
        .main-content {
            margin-left: 250px; /* Match the sidebar width */
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Farmer Panel</h2>
        <a href="farmerhome"><i class="fas fa-home"></i> Home</a>
        <a href="farmeraddproduct"><i class="fas fa-plus"></i> Add Products</a>
        <a href="farmerproducts"><i class="fas fa-list"></i> My Products</a>
        <a href="farmerupdateproduct"><i class="fas fa-edit"></i> Update Products</a>
        <a href="farmerdeleteproduct"><i class="fas fa-trash"></i> Delete Products</a>
        <a href="farmerviewallusers"><i class="fas fa-users"></i> View All Users</a>
        <a href="farmerupdateprofile"><i class="fas fa-user-cog"></i> Profile</a>
        <a href="#"><i class="fas fa-chart-line"></i> View Income (Dummy)</a>
        <a href="farmerlogout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</body>
</html>
