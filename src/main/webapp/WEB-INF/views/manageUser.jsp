<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<head>
    <meta charset="UTF-8">
    <title>PIC Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f5f6fa;
            --danger-color: #e74c3c;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --text-color: #2c3e50;
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--secondary-color);
            margin: 0;
            min-height: 100vh;
        }

        .container {
            display: flex;
            min-height: 100vh;
            padding: 0;
            margin: 0;
            max-width: none;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, #2c3e50 0%, #3498db 100%);
            padding: 2rem 0;
            position: fixed;
            height: 100vh;
            color: white;
        }

        .sidebar header {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 600;
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

        .content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 2rem;
        }

        .header {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .profile-info {
            text-align: right;
            font-weight: 500;
            color: var(--text-color);
        }

        .school-list {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .school-list h1 {
            color: var(--text-color);
            margin-bottom: 2rem;
            font-size: 2rem;
            font-weight: 600;
        }

        .search-bar {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .search-bar input {
            flex: 1;
            padding: 0.8rem 1.2rem;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-bar input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.2);
        }

        .search-bar button {
            padding: 0.8rem 2rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #357abd;
            transform: translateY(-1px);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
        }

        table th, table td {
            padding: 1.2rem;
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
            margin: 0 0.3rem;
        }

        .btn-edit {
            background-color: var(--warning-color);
            color: white;
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-edit:hover, .btn-delete:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .content {
                margin-left: 0;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
	<div class="container">
		<aside class="sidebar">
			<header>TVPSS</header>
			<ul class="menu">
				<li class="active">Users</li>
				<li><a href='manageUser'>School Management</a></li>
				<li><a href='manageResource'>Resource</a></li>
			</ul>
		</aside>
		<main class="content">
			<header class="header">

				<div class="profile-info">
					<p>
						Acad<br>Admin
					</p>
				</div>
			</header>
			<section class="school-list">
				<h1>PIC Management</h1>
				<div class="search-bar">
					<input type="text" placeholder="Search student">
					<button>Search</button>
				</div>
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>Name</th>
							<th>Age</th>
							<th>School</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pic" items="${pics}">
							<tr id="row${pic.id}">
							    <td>${pic.id}</td>
							    <td data-name="${pic.name}">${pic.name}</td>
							    <td data-age="${pic.age}">${pic.age}</td>
							    <td data-school="${pic.school.name}">${pic.school.name}</td>
							    <td>
							        <button class="btn btn-edit" onclick="editForm('${pic.id}')">Edit</button>
							        <button class="btn btn-delete" onclick="deleteRecord('${pic.id}')">Delete</button>
							    </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</main>
	</div>
	

<script>
function editForm(id) {
    console.log("Editing school with ID:", id);
    // Create and submit a form to navigate to edit page
    const form = document.createElement('form');
    form.method = 'GET';
    form.action = 'editUser';

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
        form.action = 'deleteUser';

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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>