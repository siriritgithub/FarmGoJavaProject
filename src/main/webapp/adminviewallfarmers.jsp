<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "jakarta.tags.core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADMIN | VIEW ALL FARMERS</title>
    <style>
        /* Reset default browser styles */
       /* Reset default browser styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    line-height: 1.6;
}

.main-content {
    max-width: 1200px;
    margin: 30px auto;
    padding: 20px;
}

h3 {
    text-align: center;
    font-size: 2rem;
    color: #333;
    margin-bottom: 30px;
}

.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 20px;
}

.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    object-position: center;
}

.card-content {
    padding: 15px;
}

.card-content h4 {
    font-size: 1.2rem;
    color: #333;
    margin-bottom: 10px;
}

.card-content p {
    font-size: 1rem;
    color: #666;
    margin-bottom: 8px;
}

.card-content .state {
    font-weight: bold;
    color: #007BFF;
}

button {
    padding: 10px 20px;
    font-size: 1rem;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    background-color: #007BFF;
    color: #fff;
    margin-top: 10px;
}

button:hover {
    background-color: #0056b3;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    max-width: 500px;
    width: 100%;
}

.modal-header {
    font-size: 1.5rem;
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.modal-buttons {
    display: flex;
    justify-content: space-between;
}

.modal-buttons button {
    padding: 12px 20px;
    font-size: 1rem;
    cursor: pointer;
    border: none;
    border-radius: 5px;
}

.cancel-btn {
    background-color: #ccc;
    color: #333;
}

.delete-btn {
    background-color: #ff4d4d;
    color: #fff;
}

.cancel-btn:hover {
    background-color: #bbb;
}

.delete-btn:hover {
    background-color: #e60000;
}

/* Success message pop-up */
.popup-message {
    position: fixed;
    top: 20%;
    left: 50%;
    transform: translateX(-50%);
    background-color: green;
    color: white;
    padding: 15px;
    border-radius: 5px;
    display: none;
    z-index: 1000;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .card-container {
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    }

    .modal-content {
        padding: 20px;
    }

    .modal-header {
        font-size: 1.2rem;
    }

    button {
        font-size: 0.9rem;
        padding: 8px 15px;
    }

    .modal-buttons button {
        padding: 8px 15px;
    }
}


    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="main-content">
        <h3>View All Farmers</h3>
        <div class="card-container">
            <c:forEach items="${farmerslist}" var="farmer">
                <div class="card">
                    <img src="${farmer.image}" alt="Farmer Image" onerror="this.src='default-placeholder.png';" />
                    <div class="card-content">
                        <h4><c:out value="${farmer.name}" /></h4>
                        <p>Phone: <c:out value="${farmer.phone}" /></p>
                        <p>Username: <c:out value="${farmer.username}" /></p>
                        <p>Address: <c:out value="${farmer.address}" /></p>
                        <p class="state">State: <c:out value="${farmer.state}" /></p>
                        <!-- Delete Button -->
                        <button onclick="openDeleteModal(${farmer.id}, '${farmer.name}')">Delete</button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Confirm Deletion</h2>
                </div>
                <p>Are you sure you want to delete this farmer?</p>
                <div class="modal-buttons">
                    <button class="cancel-btn" onclick="closeDeleteModal()">No</button>
                    <form id="deleteForm" action="deletefarmer" method="POST">
                        <input type="hidden" id="farmerId" name="farmerId" value="" />
                        <button type="submit" class="delete-btn" onclick="showSuccessMessage()">Yes</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Success Message Pop-up -->
        <div id="popupMessage" class="popup-message">Farmer Deleted Successfully</div>
    </div>

    <script>
        // Open the delete confirmation modal
        function openDeleteModal(farmerId, farmerName) {
            document.getElementById("farmerId").value = farmerId;
            document.getElementById("deleteModal").style.display = "flex";
        }

        // Close the delete confirmation modal
        function closeDeleteModal() {
            document.getElementById("deleteModal").style.display = "none";
        }

        // Show success message pop-up
        function showSuccessMessage() {
            var popup = document.getElementById("popupMessage");
            popup.style.display = "block";
            setTimeout(function() {
                popup.style.display = "none";
            }, 3000); // Hide the message after 3 seconds
        }
    </script>
</body>
</html>