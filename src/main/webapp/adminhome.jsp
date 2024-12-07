<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FarmGo | Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #F5F5F7; /* Background from palette */
            display: flex;
        }
		   .header h2 {
            font-size: 2.5rem;
            z-index: 1;
        }
        /* Vertical Navigation Bar */
        .vertical-nav {
            width: 220px;
            height: 100vh;
            background-color: #808000; /* Navbar color */
            color: #808000;
            padding: 20px;
            box-sizing: border-box;
        }

        .vertical-nav h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.5rem;
        }

        .vertical-nav a {
            display: block;
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .vertical-nav a:hover {
            background-color: #EDDDE0; /* Hover background */
            color: #705C53; /* Hover text */
        }

        /* Main Content */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* Section 1: Header with Background Image */
        .header {
            background-image: url('https://t3.ftcdn.net/jpg/01/57/34/62/360_F_157346244_A6Oml9kXsQdK3WaVVg91UnzheU0YeFpe.jpg');
            background-size: cover;
            background-position: center;
            
            height: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #705C53; /* Text color from palette */
            position: relative;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(237, 221, 224, 0.5); /* Semi-transparent overlay */
        }

        .header h1 {
            font-size: 2.5rem;
            z-index: 1;
        }

        /* Section 2: Features */
        .features {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
            gap: 20px;
        }

        .feature-card {
            flex: 1 1 calc(25% - 40px); /* 4 cards per row, responsive */
            background-color: #F5F5F7; /* Card background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15);
        }

        .feature-card i {
            font-size: 2rem;
            color: #705C53; /* Icon color */
            margin-bottom: 15px;
        }

        .feature-card h3 {
            font-size: 1.2rem;
            color: #705C53;
            margin-bottom: 10px;
        }

        .feature-card p {
            font-size: 0.9rem;
            color: #B7B7B7; /* Text color */
            margin-bottom: 15px;
        }

        .feature-card button {
            background-color: #705C53; /* Button color */
            color: #FFFFFF;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: background-color 0.3s;
        }

        .feature-card button:hover {
            background-color: #EDDDE0; /* Button hover */
            color: #705C53; /* Hover text */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .features {
                flex-direction: column;
                align-items: center;
            }

            .feature-card {
                flex: 1 1 100%;
            }

            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Vertical Navigation -->
  <%@ include file="adminnavbar.jsp" %>
    <!-- Main Content -->
    <div class="main-content">
        <!-- Header Section -->
        <div class="header">
            <h1>Welcome to FarmGo Dashboard</h1>
            <h2>Logged as Admin!</h2>
        </div>

        <!-- Features Section -->
        <div class="features">
            <div class="feature-card">
                <i class="fas fa-chart-line"></i>
                <h3>Analytics</h3>
                <p>Still yet to code not completed</p>
                <button>View Details(Dummy)</button>
            </div>
            <div class="feature-card">
                <i class="fas fa-boxes"></i>
                <h3>View Feedbacks</h3>
                <p>You Can Access All The Feedbacks of Farmers,users,accessers from here.</p>
                <button>View Products</button>
            </div>
            <div class="feature-card">
                <i class="fas fa-user-friends"></i>
                <h3>Farmer Profiles Generation</h3>
                <p>Access and manage profiles and register farmers in one place.</p>
                <button>View Farmers</button>
            </div>
        </div>
    </div>
</body>
</html>
