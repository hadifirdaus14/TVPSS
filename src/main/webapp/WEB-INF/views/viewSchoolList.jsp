<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Management</title>
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
	background-color: #ffc00b ;
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
			<div class="logo">
				<img src="tvpss-logo.png" alt="TV PSS">
			</div>
			<ul class="menu">
				<li>Profile</li>
				<li>Dashboard</li>
				<li class="active">School Management</li>
				<li>Resource</li>
				<li>Setting</li>
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
						<c:forEach var="school" items="${school}">
							<tr id="row${school.id}">
								<td>${school.id}</td>
								<td>${school.code}</td>
								<td>${school.name}</td>
								<td>${school.type}</td>
								<td>${school.district}</td>
								<td>
									<button class="btn btn-edit" onclick="editRecord">Edit</button>
									<button class="btn btn-delete" onclick="deleteRecord">Delete</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</main>
	</div>

	<div id="editForm" style="display: none;">
		<form id="updateForm">
			<input type="text" id="editCode" name="code"
				placeholder="School Code"> <input type="text" id="editName"
				name="name" placeholder="School Name"> <label
				for="schoolType">School Type:</label> <select id="schoolType"
				name="schoolType">
				<option value="primary">Primary School</option>
				<option value="secondary">Secondary School</option>
			</select> <input type="text" id="editDistrict" name="district"
				placeholder="District">
			<button type="button" onclick="saveRecord(1)">Save</button>
		</form>
	</div>

	<script>
	function editRecord(id) {
	    // Show the form
	    document.getElementById('editForm').style.display = 'block';

	    // Pre-fill the form with data
	    const code = document.getElementById(`code${id}`).getAttribute('data-code');
	    const name = document.getElementById(`name${id}`).getAttribute('data-name');
	    const type = document.getElementById(`type${id}`).getAttribute('data-type');
	    const district = document.getElementById(`district${id}`).getAttribute('data-district');

	    document.getElementById('editCode').value = code;
	    document.getElementById('editName').value = name;
	    document.getElementById('schoolType').value = type;
	    document.getElementById('editDistrict').value = district;
	}

	function saveRecord(id) {
	    // Update the row data with the form values
	    const code = document.getElementById('editCode').value;
	    const name = document.getElementById('editName').value;
	    const type = document.getElementById('schoolType').value;
	    const district = document.getElementById('editDistrict').value;

	    // Update the table row
	    document.getElementById(`code${id}`).textContent = code;
	    document.getElementById(`code${id}`).setAttribute('data-code', code);

	    document.getElementById(`name${id}`).textContent = name;
	    document.getElementById(`name${id}`).setAttribute('data-name', name);

	    document.getElementById(`type${id}`).textContent = type;
	    document.getElementById(`type${id}`).setAttribute('data-type', type);

	    document.getElementById(`district${id}`).textContent = district;
	    document.getElementById(`district${id}`).setAttribute('data-district', district);

	    // Hide the form
	    document.getElementById('editForm').style.display = 'none';
	}

	function deleteRecord(id) {
	    if (confirm("Are you sure you want to delete this record?")) {
	        const row = document.getElementById(`row${id}`);
	        if (row) {
	            row.remove();
	        }
	    }
	}

	</script>

</body>
</html>