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
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	height: 100vh;
}

.sidebar {
	width: 250px;
	background-color: #f8f9fa;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px 0;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar .logo img {
	width: 80%;
	margin-bottom: 30px;
}

.sidebar .menu {
	list-style: none;
	padding: 0;
}

.sidebar .menu li {
	width: 100%;
	padding: 15px;
	text-align: center;
	cursor: pointer;
}

.sidebar .menu li.active {
	background-color: #007bff;
	color: white;
}

.content {
	flex: 1;
	display: flex;
	flex-direction: column;
	background-color: #f1f1f1;
	padding: 20px;
}

.header {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-bottom: 20px;
}

.studio-info {
	display: flex;
	gap: 20px;
}

.studio-level {
	background-color: #007bff;
	color: white;
	padding: 15px;
	border-radius: 8px;
	text-align: center;
	font-size: 14px;
	line-height: 1.5;
}

.statistics {
	display: flex;
	align-items: center;
	gap: 20px;
}

.chart {
	width: 100px;
	height: 100px;
	background-color: #ddd;
	border-radius: 50%;
}

.stats {
	font-size: 14px;
	text-align: center;
}

.profile-info {
	text-align: right;
}

.profile-photo {
	position: absolute;
	top: 46px;
	right: 5px;
}

.school-list {
	background-color: white;
	border-radius: 8px;
	padding: 20px;
}

.school-list h1 {
	margin-bottom: 20px;
}

.search-bar {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.search-bar input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.search-bar button {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

table th {
	background-color: #f8f9fa;
}

table tbody tr:nth-child(odd) {
	background-color: #f9f9f9;
}

.btn {
	padding: 5px 10px;
	font-size: 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-add {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-bottom: 10px;
}

.btn-edit {
	background-color: orange;
	color: white;
}

.btn-edit:hover {
	background-color: #ffc00b;
}

.btn-delete {
	background-color: #dc3545;
	color: white;
}

.btn-delete:hover {
	background-color: #c82333;
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