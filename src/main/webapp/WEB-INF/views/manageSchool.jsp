<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>School Management</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f5f6fa;
            --danger-color: #e74c3c;
            --edit-color: #f39c12;
            --text-color: #2c3e50;
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--secondary-color);
            color: var(--text-color);
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, #2c3e50 0%, #3498db 100%);
            color: white;
            padding: 2rem 0;
            position: fixed;
            height: 100vh;
        }

        .sidebar .logo {
            text-align: center;
            margin-bottom: 3rem;
        }

        .sidebar .logo h2 {
            font-size: 2rem;
            margin: 0;
            background: -webkit-linear-gradient(#fff, #ddd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            padding: 1rem 2rem;
            transition: all 0.3s ease;
        }

        .menu li a {
            color: white;
            text-decoration: none;
            display: block;
            font-size: 1.1rem;
        }

        .menu li.active {
            background: rgba(255, 255, 255, 0.1);
            border-left: 4px solid white;
        }

        .menu li:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 2rem;
        }

        .header {
            background: white;
            padding: 1rem 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .profile-info {
            text-align: right;
            font-weight: 500;
        }

        .school-list {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .school-list h1 {
            color: var(--text-color);
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }

        .search-bar {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .search-bar input {
            flex: 1;
            padding: 0.8rem 1rem;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-bar input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
        }

        .search-bar button {
            padding: 0.8rem 2rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #357abd;
        }
        
        .search-bar button {
            padding: 0.8rem 2rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
        }

        table th, table td {
            padding: 1rem;
            border: 1px solid #e1e1e1;
        }

        table th {
            background-color: #f8f9fa;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }

        table tr:hover {
            background-color: #f8f9fa;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0 0.2rem;
        }

        .btn-edit {
            background-color: var(--edit-color);
            color: white;
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-edit:hover {
            background-color: #e67e22;
            transform: translateY(-1px);
        }

        .btn-delete:hover {
            background-color: #c0392b;
            transform: translateY(-1px);
        }

        #editForm {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            width: 400px;
            max-width: 90%;
        }

        #editForm form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        #editForm input,
        #editForm select {
            padding: 0.8rem;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
        }

        #editForm label {
            font-weight: 500;
            margin-bottom: -0.5rem;
        }

        #editForm button {
            padding: 1rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        #editForm button:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>
	<div class="container">
		<aside class="sidebar">
			<div class="logo">
				<h2>TVPSS</h2>
			</div>
			<ul class="menu">
				<li><a href="manageUser">Users</a></li>
				<li class="active"><a href=" ">School Management</a></li>
				<li><a href=" ">Resource</a></li>
			</ul>
		</aside>
		<main class="content">
			<header class="header">

				<div class="profile-info">
					<p>
						Hadi Firdaus<br>Admin
					</p>
				</div>
			</header>
			<section class="school-list">
				<h1>School Management</h1>
				<div class="search-bar">
					<input type="text" placeholder="Search school">
					<button>Search</button>
				</div>
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>Code</th>
							<th>School Name</th>
							<th>Type</th>
							<th>District</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="school" items="${schools}">
							<tr id="row${school.id}" data-debug="true">
								<td>${school.id}</td>
								<td data-code="${school.code}">${school.code}</td>
							    <td data-name="${school.name}">${school.name}</td>
							    <td data-type="${school.type}">${school.type}</td>
							    <td data-district="${school.district}">${school.district}</td>
								<td>
									<button class="btn btn-edit" onclick="editForm('${school.id}')">Edit</button>
									<button class="btn btn-delete" onclick="deleteRecord('${school.id}')">Delete</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</main>
	</div>
	<div id="editForm" style="display: none;">
		<form id="updateForm" action="/updateSchool" method="POST">
			<label for="schoolCode">School Code:</label>
		    <input type="text" id="editCode" name="code" placeholder="School Code">
		    <label for="schoolName">School Name:</label>
		    <input type="text" id="editName" name="name" placeholder="School Name">
		    <label for="schoolType">School Type:</label>
		    <select id="schoolType" name="type">
		        <option value="primary">Primary School</option>
		        <option value="secondary">Secondary School</option>
	    	</select>
	    	<label for="schoolDistrict">District:</label>
		    <input type="text" id="editDistrict" name="district" placeholder="District">
		    <button type="submit">Save</button>
		</form>

	</div>

	<script>
	
	console.log("School IDs available:", [
        <c:forEach var="school" items="${schools}" varStatus="status">
            ${school.id}${!status.last ? ',' : ''}
        </c:forEach>
    ]);
	
	function editForm(id) {
	    console.log("Editing school with ID:", id);
	    // Create and submit a form to navigate to edit page
	    const form = document.createElement('form');
	    form.method = 'GET';
	    form.action = 'editSchool';

	    // Create hidden input for ID
	    const idInput = document.createElement('input');
	    idInput.type = 'hidden';
	    idInput.name = 'id';
	    idInput.value = id;

	    // Add input to form
	    form.appendChild(idInput);

	    // Add form to document and submit
	    document.body.appendChild(form);
	    form.submit();
	}
	
	function deleteRecord(id) {
	    console.log("Attempting to delete school with ID:", id);
	    
	    if (confirm("Are you sure you want to delete this school?")) {
	        // Create a form dynamically
	        const form = document.createElement('form');
	        form.method = 'POST';
	        form.action = 'deleteSchool';

	        // Create hidden input for ID
	        const idInput = document.createElement('input');
	        idInput.type = 'hidden';
	        idInput.name = 'id';
	        idInput.value = id;

	        // Add the input to form
	        form.appendChild(idInput);

	        // Add form to document and submit
	        document.body.appendChild(form);
	        form.submit();
	    }
	}

	</script>

</body>
</html>