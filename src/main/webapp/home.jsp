<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- Embedded CSS -->
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #B2C9AD;
            color: #333;
        }

        header {
            background-color: #008080; /* Header background color */
            padding: 5px 0; /* Reduced padding for smaller header height */
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

        header h1 {
            color: #ffffff;
            margin: 0;
            font-size: 1.8rem; /* Adjusted for a balanced look */
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
            color: #F5F0CD;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        header nav ul li a:hover {
            color: #FFD700;
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 70vh;
            color: #ffffff;
            background: url('https://images.deepai.org/art-image/5a2d183ac41b4a6f975da1ba78853701/farmer-standing-in-the-field-and-looking-at-h_vBHXezk.jpg') no-repeat center center/cover;
            position: relative;
        }

        .hero::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Overlay effect */
            z-index: 1;
        }

        .hero .container {
            position: relative;
            z-index: 2;
            max-width: 800px;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }

        .hero p {
            font-size: 1.2rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .grid-item {
            background: linear-gradient(135deg, #91AC8F, #66785F);
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            color: #2A3335;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .grid-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .grid-item img {
            width: 80px;
            margin-bottom: 15px;
        }

        .grid-item h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .grid-item p {
            font-size: 1rem;
        }

        .info-containers {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .info-item {
            flex: 1;
            min-width: 250px;
            background: linear-gradient(135deg,  #91AC8F, #66785F);
            border-radius: 10px;
            color: #2A3335;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .info-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .info-item h3 {
            margin-bottom: 15px;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .info-item p {
            font-size: 1rem;
            line-height: 1.5;
        }
    </style>
</head>
<body>

<header>
    <div class="container">
        <h1>FarmGo</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="homeservices.jsp">Services</a></li>
                <li><a href="homeaboutus.jsp">About</a></li>
                <li><a href="homefeedbackus.jsp">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h1>Welcome to FarmGo</h1>
        <p>Explore the future of farming with FarmGo. Join us today!</p>
    </div>
</section>

<section class="grid-container">
    <div class="grid-item" onclick="location.href='userlogin.jsp';">
        <img src="https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-1024.png" alt="User Login">
        <h3>Login</h3>
        <p>Access fresh produce directly from farmers.</p>
    </div>
    <div class="grid-item" onclick="location.href='userregestration.jsp';">
        <img src="https://www.pngmart.com/files/21/Admin-Profile-PNG.png" alt="Register">
        <h3>Register</h3>
        <p>Join our community of farmers and customers.</p>
    </div>
    <div class="grid-item" onclick="location.href='adminlogin.jsp';">
        <img src="https://cdn3.iconfinder.com/data/icons/dev-people/512/user_login-256.png" alt="Admin Login">
        <h3>Admin Login</h3>
        <p>Manage operations securely.</p>
    </div>
</section>

<section class="info-containers">
    <div class="info-item">
        <h3>Fresh from Farmers</h3>
        <p>Buy directly from farmers for the freshest and healthiest produce.</p>
    </div>
    <div class="info-item">
        <h3>Secure Payments</h3>
        <p>Seamless and secure payment options for every transaction.</p>
    </div>
    <div class="info-item">
        <h3>Fair Pricing</h3>
        <p>Empowering farmers with fair prices while ensuring affordability for customers.</p>
    </div>
    <div class="info-item">
        <h3>24/7 Support</h3>
        <p>Our team is here to assist you round the clock, ensuring a smooth experience.</p>
    </div>
</section>

</body>
</html>
