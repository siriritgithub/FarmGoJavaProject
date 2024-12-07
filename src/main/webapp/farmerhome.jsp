<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FarmGo | Farmer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js Library -->
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            display: flex;
        }

        .vertical-nav {
            width: 220px;
            height: 100vh;
            background-color: #705C53;
            color: #FFFFFF;
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
            background-color: #EDDDE0;
            color: #705C53;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-image: url('https://th.bing.com/th/id/OIP.bb3kYwk62vbGjd_BNfS6GwHaEK?rs=1&pid=ImgDetMain');
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #705C53;
            position: relative;
        }

        .header h1, .header h2 {
            z-index: 1;
        }

        .dashboard-section {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            gap: 20px;
        }

        .dashboard-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .dashboard-graph {
            flex: 1 1 calc(50% - 10px);
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            height: 400px;
        }

        .dashboard-card {
            flex: 1 1 calc(33.33% - 10px);
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
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

        .feature-card a {
            display: inline-block;
            background-color: #705C53; /* Button color */
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s;
        }

        .feature-card a:hover {
            background-color: #EDDDE0; /* Button hover */
            color: #705C53; /* Hover text */
        }

        @media (max-width: 768px) {
            .dashboard-graph, .dashboard-card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <%@ include file="farmernavbar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Welcome to FarmGo Dashboard</h1>
            <h2>Logged in as Farmer</h2>
        </div>
        <div class="dashboard-section">
            <!-- Row 1: Graphs Side by Side -->
            <div class="dashboard-row">
                <div class="dashboard-graph">
                    <h3>Income Trends</h3>
                    <canvas id="incomeTrendsChart"></canvas>
                </div>
                <div class="dashboard-graph">
                    <h3>Product Performance Graph</h3>
                    <canvas id="productPerformanceChart"></canvas>
                </div>
            </div>
            <!-- Row 2: Graphs Side by Side -->
            <div class="dashboard-row">
                <div class="dashboard-graph">
                    <h3>Market Price Updates</h3>
                    <canvas id="marketPriceUpdatesChart"></canvas>
                </div>
                <div class="dashboard-graph">
                    <h3>Customer Feedback Analysis</h3>
                    <canvas id="customerFeedbackChart"></canvas>
                </div>
            </div>
            <!-- Row 3: Cards Side by Side -->
            <div class="features">
            <div class="feature-card">
               <i class="fas fa-info-circle"></i>
                <h3>About Us</h3>
                <p>Click here to know about us</p>
                <p>on-click you will be logged out for authentication reasons</p>
                <a href="aboutus">About us</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-envelope"></i>
                <h3>Services</h3>
                <p>You Can contact us from here for any queries.</p>
                 <p>on-click you will be logged out for authentication reasons</p>
                <a href="homeservices.jsp">Contact us</a>
            </div>
            
            <div class="feature-card">
                <i class="fas fa-question-circle"></i>
                <h3>Help</h3>
                <p>24/7 available</p>
                 <p>on-click you will be logged out for authentication reasons</p>
                <a href="home247.jsp">Help</a>
            </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Graphs -->
    <script>
        // Income Trends Chart
        const incomeTrendsCtx = document.getElementById('incomeTrendsChart').getContext('2d');
        new Chart(incomeTrendsCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Income',
                    data: [3000, 4000, 3500, 5000, 4500, 5500],
                    borderColor: '#705C53',
                    fill: false,
                    tension: 0.1
                }]
            }
        });

        // Product Performance Chart
        const productPerformanceCtx = document.getElementById('productPerformanceChart').getContext('2d');
        new Chart(productPerformanceCtx, {
            type: 'bar',
            data: {
                labels: ['Product A', 'Product B', 'Product C', 'Product D'],
                datasets: [{
                    label: 'Sales',
                    data: [200, 300, 250, 400],
                    backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4CAF50']
                }]
            }
        });

        // Market Price Updates Chart
        const marketPriceUpdatesCtx = document.getElementById('marketPriceUpdatesChart').getContext('2d');
        new Chart(marketPriceUpdatesCtx, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                datasets: [{
                    label: 'Price',
                    data: [150, 160, 155, 165],
                    borderColor: '#36A2EB',
                    fill: false,
                    tension: 0.1
                }]
            }
        });

        // Customer Feedback Analysis Chart
        const customerFeedbackCtx = document.getElementById('customerFeedbackChart').getContext('2d');
        new Chart(customerFeedbackCtx, {
            type: 'pie',
            data: {
                labels: ['Positive', 'Neutral', 'Negative'],
                datasets: [{
                    data: [70, 20, 10],
                    backgroundColor: ['#4CAF50', '#FFCE56', '#FF6384']
                }]
            }
        });
    </script>
</body>
</html>
