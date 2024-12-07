<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - PRO'FX</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        body {
            padding-top: 60px; /* Adjust this value to match the navbar height */
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px;
            text-align: center;
        }

        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #4CAF50; /* Light Green background */
            color: white;
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            font-family: Arial, sans-serif;
            font-size: 16px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Light shadow */
            opacity: 0; /* Initially hidden */
            transform: translateY(-20px); /* Slightly off-screen */
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .notification.show {
            opacity: 1; /* Fully visible */
            transform: translateY(0); /* Slide into view */
        }

        .notification h5 {
            font-size: 18px;
            margin: 0;
            font-weight: bold;
        }

        .notification p {
            font-size: 14px;
            margin: 5px 0 0;
        }
    </style>
</head>
<body>
    <%@ include file="demoheader.jsp" %>
    <div class="container">
        <h2>Our Services</h2>
        <p>
            At <span style="color: #705C53; font-weight: bold;">PRO'FX</span>, we offer a range of solutions tailored to help farmers manage their operations efficiently. Explore our services below:
        </p>
        <div id="logoutNotification" class="notification">
            <h5>YOU ARE NOW LOGGED OUT</h5>
            <p>Thank you for visiting. Please login!</p>
        </div>
        <div class="services-grid">
            <div class="service-item">
                <i class="fas fa-tractor"></i>
                <h3>Farm Management</h3>
                <p>Streamline your farm operations with our comprehensive management tools designed for efficiency and growth.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-chart-line"></i>
                <h3>Analytics & Insights</h3>
                <p>Get detailed insights and analytics to track productivity, monitor trends, and make informed decisions.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-users"></i>
                <h3>Community Support</h3>
                <p>Connect with other farmers, share knowledge, and get expert advice tailored to your farming needs.</p>
            </div>
            <div class="service-item">
                <i class="fas fa-tools"></i>
                <h3>Equipment Support in future</h3>
                <p>Access modern equipment and tools to boost your farm's productivity and efficiency.</p>
            </div>
        </div>
    </div>
</body>
<script>
    function showLogoutNotification() {
        const notification = document.getElementById('logoutNotification');
        // Add the 'show' class to make it visible
        notification.classList.add('show');

        // Remove the notification after 3 seconds
        setTimeout(() => {
            notification.classList.remove('show');
        }, 3000);
    }

    // Show the notification immediately for testing
    showLogoutNotification();
</script>
</html>
