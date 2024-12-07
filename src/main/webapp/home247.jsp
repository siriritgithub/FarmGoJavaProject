<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help 24/7 - PRO'FX</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        /* Header styling */
        .header {
            width: 100%;
            background-color: #705C53;
            color: white;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
            margin: 0;
            color: white;
        }

        .header nav {
            display: flex;
            gap: 15px;
        }

        .header nav a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            transition: color 0.3s;
        }

        .header nav a:hover {
            color: #F5F5F7;
        }

        .help-container {
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
        }

        .help-container h2 {
            color: #705C53;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .help-container p {
            color: #B7B7B7;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .help-links {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .help-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #FFFFFF;
            background-color: #705C53;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .help-links a i {
            margin-right: 10px;
            font-size: 18px;
        }

        .help-links a:hover {
            background-color: #B7B7B7;
            transform: translateY(-3px);
        }

        /* Notification Styles */
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #f44336;
            color: white;
            padding: 20px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
            z-index: 1000;
        }

        .notification.show {
            opacity: 1;
            transform: translateY(0);
        }

        .notification h5 {
            font-size: 18px;
            margin: 0;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .header h1 {
                margin-bottom: 10px;
            }

            .help-links a {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <%@ include file="demoheader.jsp" %>

    <!-- Logout Notification -->
    <div id="logoutNotification" class="notification">
        <h5>You are Logged Out</h5>
        <p>Thank you for using our platform!</p>
    </div>

    <div class="help-container">
        <h2>Help 24/7</h2>
        <p>We are here to assist you at any time! Reach out to us on your favorite platform.</p>
        <div class="help-links">
            <a href="https://instagram.com" target="_blank">
                <i class="fab fa-instagram"></i> Instagram
            </a>
            <a href="https://telegram.org" target="_blank">
                <i class="fab fa-telegram-plane"></i> Telegram
            </a>
            <a href="https://wa.me" target="_blank">
                <i class="fab fa-whatsapp"></i> WhatsApp
            </a>
            <a href="https://twitter.com" target="_blank">
                <i class="fab fa-twitter"></i> Twitter
            </a>
        </div>
    </div>

    <script>
        // Show the logout notification
        function showLogoutNotification() {
            const notification = document.getElementById('logoutNotification');
            notification.classList.add('show'); // Show notification

            // Automatically hide after 3 seconds
            setTimeout(() => {
                notification.classList.remove('show');
            }, 3000);
        }

        // Call the notification function on page load
        window.onload = showLogoutNotification;
    </script>
</body>
</html>
