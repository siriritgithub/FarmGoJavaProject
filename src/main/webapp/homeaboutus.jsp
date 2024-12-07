<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - PRO'FX</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: "Poppins", Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        body {
            padding-top: 60px;
        }

        .container {
            display: flex;
            border-radius: 10px;
            overflow: hidden;
            max-width: 1000px;
            width: 100%;
            margin: auto;
            align-items: center;
        }

        .image-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .content-container {
            flex: 1.5;
            padding: 40px;
        }

        .content-container h2 {
            margin-bottom: 20px;
            color: #705C53;
            font-size: 28px;
            font-weight: 700;
        }

        .content-container h3 {
            color: #4CAF50;
            font-size: 22px;
            margin-top: 30px;
            font-weight: bold;
        }

        .content-container p {
            margin-bottom: 20px;
            color: #444;
            font-size: 16px;
            line-height: 1.6;
        }

        .content-container .highlight {
            color: #705C53;
            font-weight: bold;
            font-size: 18px;
        }

        .content-container a {
            text-decoration: none;
            color: #705C53;
            font-weight: bold;
            border: 1px solid #705C53;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }

        .content-container a:hover {
            background-color: #705C53;
            color: #FFFFFF;
        }

        /* Team Section Styling */
        .team-section {
            text-align: center;
            margin: 40px 0;
        }

        .team-section h2 {
            color: #705C53;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .team-members {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .team-member {
            text-align: center;
            width: 200px;
            margin: 10px;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #4CAF50;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .team-member img:hover {
            transform: scale(1.1);
        }

        .team-member h4 {
            color: #705C53;
            font-size: 18px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .team-member p {
            color: #B7B7B7;
            font-size: 14px;
        }

        .social-icons {
            margin-top: 10px;
        }

        .social-icons a {
            margin: 0 5px;
            color: #705C53;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: #4CAF50;
        }

        /* Notification Style */
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .image-container {
                height: 200px;
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

    <!-- Team Section -->
    <div class="team-section">
        <h2>Our Team</h2>
        <div class="team-members">
            <div class="team-member">
                <img src="https://via.placeholder.com/150" alt="Team Member 1">
                <h4>Meghan Kumar Andrapu</h4>
                <p>CEO & Founder</p>
                <div class="social-icons">
                   <a href="mailto:example@example.com"><i class="fas fa-envelope"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-hackerrank"></i></a>
                </div>
            </div>
            <div class="team-member">
                <img src="https://via.placeholder.com/150" alt="Team Member 2">
                <h4>Lakshmi Laalasa</h4>
                <p>CTO</p>
                <div class="social-icons">
                    <a href="mailto:example@example.com"><i class="fas fa-envelope"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-hackerrank"></i></a>
                </div>
            </div>
            <div class="team-member">
                <img src="https://via.placeholder.com/150" alt="Team Member 3">
                <h4>Orlotu Sirisha</h4>
                <p>Lead Developer</p>
                <div class="social-icons">
					<a href="mailto:example@example.com"><i class="fas fa-envelope"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-hackerrank"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="image-container">
            <a href="https://imgbb.com/">
                <img src="https://i.ibb.co/8rVpb8q/Screenshot-2024-11-29-140911.png" alt="Screenshot-2024-11-29-140911" border="0">
            </a>
        </div>
        <div class="content-container">
            <h2>About FarmGo</h2>
            <h3>Our Mission</h3>
            <p>
                Welcome to <span class="highlight" onclick="window.location.href='/';">FarmGo</span>, your trusted partner in farming management solutions. 
                We empower farmers with innovative tools to streamline operations, maximize efficiency, 
                and achieve sustainable growth in agriculture.
            </p>
            <p>
                Our mission is to revolutionize the farming industry through technology and personalized support.
                By leveraging cutting-edge technology, we make managing farms smarter and more effective.
            </p>
            
            <h3>Our Values</h3>
            <p>
                We believe in building <span class="highlight" style="color:#4CAF50;">trust</span>, fostering <span class="highlight" style="color:#4CAF50;">innovation</span>, and empowering farmers to thrive. 
                Our goal is to ensure every farmer, whether small-scale or large, can benefit from our advanced farming tools.
            </p>
            
            <a href="mailto:deepak.yaramala@gmail.com">Contact Us</a>
        </div>
    </div>

    <script>
        // Show the logout notification
        function showLogoutNotification() {
            const notification = document.getElementById('logoutNotification');
            notification.classList.add('show');

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
