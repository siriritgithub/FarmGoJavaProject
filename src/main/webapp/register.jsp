<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Join Our Farming Community</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* General Page Styles */
        body {
            margin: 0;
            font-family: 'Georgia', serif;
            background-color: #f4f1e1;
        }

        .farmer-registration-page {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            flex-direction: column;
        }

        .registration-container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            padding: 30px;
        }

        .form-section {
            width: 50%;
            padding: 20px;
        }

        .form-section h2 {
            margin-bottom: 20px;
            color: #8b4513;
            font-size: 32px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            color: #2f4f4f;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #8b4513;
            box-shadow: 0px 0px 6px rgba(139, 69, 19, 0.3);
            outline: none;
        }

        .register-button {
            width: 100%;
            background-color: #8b4513;
            color: white;
            padding: 14px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .register-button:hover {
            background-color: #a0522d;
        }

        .extra-links {
            text-align: center;
            margin-top: 15px;
        }

        .extra-links a {
            text-decoration: none;
            color: #8b4513;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .extra-links a:hover {
            color: #a0522d;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .image-container {
            width: 50%;
            height: 350px;
            background-image: url('https://i.pinimg.com/originals/03/7e/68/037e68e1413888bb6173153ac61eb5ee.jpg');
            background-position: center;
            background-size: cover;
            border-radius: 12px;
            margin-left: 20px;
        }

        @media (max-width: 768px) {
            .registration-container {
                flex-direction: column;
                width: 90%;
            }

            .form-section {
                width: 100%;
            }

            .image-container {
                width: 100%;
                height: 200px;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="farmer-registration-page">
        <div class="registration-container">
            <div class="form-section">
                <h2>Join Our Farming Community</h2>

                <!-- Server-side error and success messages -->
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <p class="success-message"><c:out value="${successMessage}" /></p>
                </c:if>

                <form action="/checkfarmerregister" method="POST">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i> Name</label>
                        <input type="text" id="name" name="name" required 
                               pattern="[A-Za-z\s]+" 
                               title="Name should contain only letters and spaces.">
                    </div>
                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone"></i> Phone (10 digits)</label>
                        <input type="tel" id="phone" name="phone" required 
                               pattern="\d{10}" 
                               title="Phone number must be exactly 10 digits.">
                    </div>
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username (Alphabet+number)</label>
                        <input type="text" id="username" name="username" required 
                               pattern="[A-Za-z0-9]+" 
                               title="Username should contain only alphanumeric characters.">
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password (5-12 chars, Alphanumeric + Special char)</label>
                        <input type="password" id="password" name="password" required 
                               pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{5,12}" 
                               title="Password must contain:
                               - At least one lowercase letter
                               - At least one uppercase letter
                               - At least one number
                               - At least one special character
                               - Length between 5 and 12 characters.">
                    </div>
                    <div class="form-group">
                        <label for="address"><i class="fas fa-home"></i> Address</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                   <div class="form-group">
    <label for="state"><i class="fas fa-map-marker-alt"></i> State</label>
    <input type="text" id="state" name="state" required 
           pattern="[A-Za-z\s]+" 
           title="State should contain only letters and spaces.">
			</div>

					<div class="form-group">
    <label for="city"><i class="fas fa-city"></i> City</label>
    <input type="text" id="city" name="city" required 
           pattern="[A-Za-z\s]+" 
           title="City should contain only letters and spaces.">
</div>

<button type="submit" class="register-button">Register</button>

                </form>

                <div class="extra-links">
                    <a href="login">Already have an account? Sign In Here</a><br>
                </div>
            </div>
            <div class="image-container"></div>
        </div>
    </div>
</body>
</html>
