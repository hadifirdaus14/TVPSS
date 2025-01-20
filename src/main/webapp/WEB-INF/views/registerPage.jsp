<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS - Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 2rem 0;
}

.register-container {
	background-color: white;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 500px;
}

.logo {
	text-align: center;
	margin-bottom: 2rem;
}

.logo h1 {
	font-size: 2.5rem;
	font-weight: bold;
	color: #333;
	margin: 0;
}

.form-control {
	padding: 0.75rem 1rem;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 1rem;
}

.btn-register {
	background-color: #6c63ff;
	color: white;
	padding: 0.75rem;
	border: none;
	border-radius: 8px;
	width: 100%;
	font-weight: 500;
	margin-top: 1rem;
	transition: background-color 0.3s ease;
}

.btn-register:hover {
	background-color: #5a50e6;
	color: white;
}

.alert {
	border-radius: 8px;
	margin-bottom: 1rem;
}

.form-label {
	color: #333;
	font-weight: 500;
	margin-bottom: 0.5rem;
}

.form-select {
	padding: 0.75rem 1rem;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 1rem;
}
</style>
</head>
<body>
	<div class="register-container">
		<div class="logo">
			<h1>TVPSS</h1>
			<p class="mt-2">Create your account</p>
		</div>

		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/register"
			method="post" id="registrationForm">

			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>

			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email" required>
			</div>

			<div class="mb-3">
				<label for="userType" class="form-label">User Type</label> <select
					class="form-select" id="userType" name="userType" required>
					<option value="">Select user type</option>
					<option value="CREW">Crew</option>
					<option value="PIC">PIC</option>
				</select>
			</div>

			<div class="mb-3">
				<label for="age" class="form-label">Age</label> <input type="number"
					class="form-control" id="age" name="age" required min="1">
			</div>

			<div class="mb-3" id="schoolField">
				<label for="schoolId" class="form-label">School</label> <select
					class="form-select" id="schoolId" name="schoolId" required>
					<option value="">Select school</option>
					<c:forEach items="${schools}" var="school">
						<option value="${school.id}">${school.name}</option>
					</c:forEach>
				</select>
			</div>

			<div class="mb-3" id="yearField" style="display: none;">
				<label for="year" class="form-label">Year</label> <select
					class="form-select" id="year" name="year">
					<option value="0">Select year</option>
					<option value="1">Form 1</option>
					<option value="2">Form 2</option>
					<option value="3">Form 3</option>
					<option value="4">Form 4</option>
					<option value="5">Form 5</option>
				</select>
			</div>

			<button type="submit" class="btn btn-register">Register</button>

			<div class="mt-3 text-center">
				<span>Already have an account? </span> <a
					href="${pageContext.request.contextPath}/login"
					style="color: #text-purple-600;">Login here</a>
			</div>
		</form>
	</div>

	<script>
		// Show/hide year field based on user type selection
		document.getElementById('userType').addEventListener('change',
				function() {
					const yearField = document.getElementById('yearField');
					const yearInput = document.getElementById('year');

					if (this.value === 'CREW') {
						yearField.style.display = 'block';
						yearInput.required = true;
					} else {
						yearField.style.display = 'none';
						yearInput.required = false;
						yearInput.value = '';
					}
				});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>