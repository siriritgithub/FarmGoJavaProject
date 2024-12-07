<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Approval Pending</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .message {
            text-align: center;
            font-size: 18px;
            color: #333;
        }
        .message p {
            margin: 15px 0;
        }
        
         .contact {
            font-size: 20px;
            color: brown;
        }
        .contact-button {
        font-weight: bolder;
        text-decoration: underline;
        color: #705C53; 
        cursor: pointer;
        transition: color 0.3s ease;
    }

    .contact-button:hover {
        color: #45a049; /* Darker green color on hover */
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <h2>Approval Pending</h2>
            <p>Your farmer account is pending admin approval.</p>
            <p>Please wait for the admin to approve your registration.</p>
            <p class="contact">
			    If you have any questions, 
			    <a href="mailto:deepak.yaramala@gmail.com" class="contact-button">contact</a> 
			    support for further assistance.
			</p>
        </div>
    </div>
</body>
</html>
