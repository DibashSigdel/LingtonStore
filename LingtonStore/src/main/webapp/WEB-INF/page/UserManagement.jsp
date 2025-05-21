<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin - User Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddProduct.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

<!-- Top Banner -->

<!-- Navbar -->
<%@ include file="/WEB-INF/page/Header.jsp" %>

<!-- Page Content -->
<main>
<h2>Admin - Manage Users</h2>

<!-- Add User Button -->
<div class="FilterLine">
    <div></div> <!-- Empty space for alignment like Product page -->
    <button class="AddProductBtn" onclick="document.getElementById('userFormPopup').style.display='block'">+ Add User</button>
</div>

<!-- User Table -->
<div class="table-container">
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th><th>Username</th><th>Full Name</th><th>Email</th><th>Phone</th><th>Role</th><th>Action</th>
    </tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.id}</td>
            <td>${u.username}</td>
            <td>${u.firstName} ${u.lastName}</td>
            <td>${u.email}</td>
            <td>${u.phoneNumber}</td>
            <td>${u.role}</td>
            <td>
		    <button type="button" onclick="openUserForm(
		        '${u.id}', '${u.firstName}', '${u.lastName}', '${u.username}', '${u.dob}',
		        '${u.gender}', '${u.email}', '${u.phoneNumber}', '${u.password}', '${u.role}'
		    )">Edit</button>
		
		    <!-- Delete User Form -->
		    <form method="post" action="${pageContext.request.contextPath}/deleteusercontroller" style="display:inline;">
			    <input type="hidden" name="userId" value="${u.id}" />
			    <button type="submit" onclick="return confirm('Delete this user?')">Delete</button>
			</form>

		</td>

        </tr>
    </c:forEach>
</table>
</div>

<!-- Add/Edit User Popup -->
<div id="userFormPopup" class="popup">
    <div class="popup-content">
        <span class="close-btn" onclick="document.getElementById('userFormPopup').style.display='none'">&times;</span>
        <h3 id="formTitle">Add/Edit User</h3>
        <form method="post" action="${pageContext.request.contextPath}/editusercontroller">
            <input type="hidden" name="userId" id="userId" />

            <label>First Name:</label>
            <input type="text" name="FirstName" id="firstName" required />

            <label>Last Name:</label>
            <input type="text" name="LastName" id="lastName" required />

            <label>Username:</label>
            <input type="text" name="Username" id="username" required />

            <label>Date of Birth:</label>
            <input type="date" name="dob" id="dob" required />

            <label>Gender:</label>
            <input type="text" name="Gender" id="gender" required />

            <label>Email:</label>
            <input type="email" name="Email" id="email" required />

            <label>Phone:</label>
            <input type="text" name="Phone" id="phone" required />

            <label>Password:</label>
            <input type="password" name="Password" id="password" required />

            <label>Role:</label>
            <select name="role" id="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>

</main>

<!-- Footer -->
<%@ include file="/WEB-INF/page/Footer.jsp" %>

<script>
    function openUserForm(id = '', firstName = '', lastName = '', username = '', dob = '', gender = '', email = '', phone = '', password = '', role = 'user') {
        document.getElementById('userFormPopup').style.display = 'block';
        document.getElementById('formTitle').innerText = id ? 'Edit User' : 'Add New User';
        document.getElementById('userId').value = id;
        document.getElementById('firstName').value = firstName;
        document.getElementById('lastName').value = lastName;
        document.getElementById('username').value = username;
        document.getElementById('dob').value = dob;
        document.getElementById('gender').value = gender;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('password').value = password;
        document.getElementById('role').value = role;
    }

    window.onclick = function(e) {
        const popup = document.getElementById('userFormPopup');
        if (e.target === popup) {
            popup.style.display = "none";
        }
    }
</script>

</body>
</html>
