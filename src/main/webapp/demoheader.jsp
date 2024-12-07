<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JFSD DEMO PROJECT</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f4f4f4, #e4ded7);
            margin: 0;
            padding: 0;
        }
        
        header {
            background-color: #608BC1; /* Change this color for the header background */
            padding: 20px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        header .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        header nav ul li {
            margin: 0 15px;
        }

        header nav ul li a {
            color: #F5F0CD; /* Change this text color for navigation links */
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        header nav ul li a:hover {
            color: #605EA1; /* Change this hover color for navigation links */
        }

        /* Header Styling */
        h2 {
            text-align: center;
            color: #705C53;
            font-size: 32px;
            margin: 20px 0;
            letter-spacing: 2px;
            font-weight: bold;
        }

        /* Redesigned Navigation Styling */
        .nav-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #705C53;
            padding: 15px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        /* Logo Styling */
        .nav-logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-left: 10px;
        }

        /* Menu Styling */
        .nav-menu {
            display: flex;
            gap: 25px;
        }

        .nav-menu a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            position: relative;
            padding: 5px 0;
            transition: color 0.3s ease-in-out;
        }

        .nav-menu a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -5px;
            width: 0;
            height: 3px;
            background-color: white;
            transition: width 0.3s ease-in-out;
        }

        .nav-menu a:hover {
            color: #B7B7B7;
        }

        .nav-menu a:hover::after {
            width: 100%;
        }

        /* Footer Styling */
        .footer {
            text-align: center;
            background-color: #705C53;
            color: white;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <h1 style="color: #ffffff;">FarmGo</h1>
        <nav>
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a href="userlogin.jsp">Login</a></li>
                <li><a href="userregister">Register</a></li>
            </ul>
        </nav>
    </div>
</header>
    <!-- Redesigned Navigation Bar -->
   <!--  <div class="nav-container">
        <div class="nav-logo">FMS</div>
        <div class="nav-menu">
            <a href="/home">Home</a>
            <a href="userlogin">Login</a>
            <a href="userregister">Register</a>
        </div> -->
    </div>
</body>
</html>