<%@ taglib uri="http://www.springframework.org/tags" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
</head>
<body>
	<h1>Admin Dashboard</h1>

	<h2>Users</h2>
	<table border="1">
		<thead>
			<tr>
				<th>Username</th>
				<th>Role</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.username}</td>
					<td>${user.role}</td>
					<td><a href="/admin/viewUser/${user.id}">View</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<h2>Reports</h2>
	<table border="1">
		<thead>
			<tr>
				<th>Report ID</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="report" items="${reports}">
				<tr>
					<td>${report.id}</td>
					<td>${report.status}</td>
					<td><a href="/admin/viewReport/${report.id}">View</a> | <a
						href="/admin/updateReportStatus/${report.id}/accepted">Accept</a>
						| <a href="/admin/updateReportStatus/${report.id}/rejected">Reject</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
