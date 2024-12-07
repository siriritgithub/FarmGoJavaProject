<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - PRO'FX</title>
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
            display: flex;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            max-width: 1000px;
            width: 100%;
            margin: auto;
            flex-direction: column;
            padding: 40px;
        }

        .container h2 {
            color: #705C53;
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        .container p {
            color: #B7B7B7;
            font-size: 16px;
            line-height: 1.6;
            text-align: center;
            margin-bottom: 30px;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        .contact-form input,
        .contact-form select,
        .contact-form textarea {
            width: 100%;
            padding: 15px;
            border: 1px solid #B7B7B7;
            border-radius: 5px;
            font-size: 16px;
            color: #705C53;
            background-color: #F5F5F7;
        }

        .contact-form textarea {
            resize: none;
            height: 150px;
        }

        .contact-form button {
            background-color: #705C53;
            color: #FFFFFF;
            font-size: 16px;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .contact-form button:hover {
            background-color: #B7B7B7;
        }

        /* Notification Styles */
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            opacity: 0; /* Hidden initially */
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

        .notification p {
            margin: 5px 0 0;
            font-size: 14px;
        }
               .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color:#f44336; /* Light Green background */
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
        <h2>Contact Us</h2>
        <p>
            We'd love to hear from you! Whether you have questions, feedback, or just want to get in touch, please fill out the form below, and we’ll get back to you as soon as possible.
        </p>
         <div id="logoutNotification" class="notification">
            <h5>YOU ARE NOW LOGGED OUT</h5>
            <p>Thank you for visiting. Please login!</p>
        </div>
        <form class="contact-form" action="submitContact" method="post" onsubmit="showSubmissionNotification(); return false;">
            <input type="text" id= "name" name="name" placeholder="Your Name" required>
            <select id = "accessor" name="userType" required>
                <option value="" disabled selected>Select Access Type</option>
                <option value="general">General Access</option>
                <option value="farmer">Farmer</option>
                <option value="user">User</option>
            </select>
            <input type="email" id = "email" name="email" placeholder="Your Email" required>
            <input type="text" id="subject" name="subject" placeholder="Subject" required>
            <textarea name="message" id ="message" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>
    <div id="submissionNotification" class="notification">
        <h5><c:if test="${not empty message}">
            <p class="error-message"><c:out value="${message}" /></p>
       		 </c:if></h5>
        <p>Thank you for contacting us. We will get back to you soon!</p>
    </div>
</body>
<script>
    function showSubmissionNotification() {
        const notification = document.getElementById('submissionNotification');
        notification.classList.add('show'); // Show notification

        // Automatically hide after 3 seconds
        setTimeout(() => {
            notification.classList.remove('show');
        }, 3000);
    }
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
