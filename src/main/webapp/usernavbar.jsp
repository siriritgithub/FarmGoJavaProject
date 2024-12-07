<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Sidebar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
            width: 270px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #808000;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }
      

        .sidebar a {
            display: block;
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

        /* Main content area */
        .main-content {
            margin-left: 250px; /* Match the sidebar width */
            padding: 20px;
        }

        /* Header Styling */
       .sidebar h2 {
    text-align: center;
    color: white;
    font-size: 26px; /* Increased font size */
    margin-bottom: 20px;
}
        /* Sidebar Icons */
        .sidebar a i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>User Panel</h2>
        <a href="userhome.jsp"><i class="fas fa-home"></i> Home</a>
        
        <a href="userviewallproducts"><i class="fas fa-box-open"></i> View All Products</a>
        <a href="userviewallfarmers"><i class="fas fa-users"></i> View All Farmers</a>
        <a href="userviewallfarmers"><i class="fas fa-clipboard-list"></i> View Orders Farmers</a>
        <a href="userupdateprofile"><i class="fas fa-user-cog"></i> Profile</a>

        <a href="userlogout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</body>
</html>
