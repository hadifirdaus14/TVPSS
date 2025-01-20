<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#editForm {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

#editForm form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

#editForm input,
#editForm select {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

#editForm button {
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

#editForm button:hover {
    background-color: #0056b3;
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
									<button class="btn btn-edit" onclick="editForm(${school.id})" data-school-id="${school.id}">Edit</button>
									<button class="btn btn-delete" onclick="deleteRecord(${school.id})">Delete</button>
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
	
	function editForm(id) {
		//see what we're receiving
	    console.log("Edit function called with ID:", id);
	    console.log("Type of ID:", typeof id);
	    
	    //look for the row directly
	    const rowId = `row${id}`;
	    console.log("Looking for row with ID:", rowId);
	    
	    //see ALL rows in the table
	    const allRows = document.querySelectorAll('table tbody tr');
	    console.log("All table rows:", allRows);
	    
	    //specifically look at row IDs
	    allRows.forEach(row => {
	        console.log("Found row with ID:", row.id);
	    });
	    
	    const row = document.getElementById(rowId);
	    
	    if (!row) {
	        console.warn(`Unable to find row with ID: ${rowId}`);
	        console.log("Current table structure:", document.querySelector('table').innerHTML);
	        alert(`Row with ID ${rowId} not found!`);
	        return;
	    }

	    // Get the cell values
	    const code = row.querySelector('td[data-code]')?.textContent;
	    const name = row.querySelector('td[data-name]')?.textContent;
	    const type = row.querySelector('td[data-type]')?.textContent;
	    const district = row.querySelector('td[data-district]')?.textContent;

	    console.log('Retrieved values:', { code, name, type, district });

	    // Populate the form
	    document.getElementById('editCode').value = code || '';
	    document.getElementById('editName').value = name || '';
	    document.getElementById('schoolType').value = type?.toLowerCase() || 'primary';
	    document.getElementById('editDistrict').value = district || '';

	    // Show the form
	    const editForm = document.getElementById('editForm');
	    editForm.style.display = 'block';
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