<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit School</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
         input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .cancel {
            background-color: #dc3545;
        }
        .cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <h1>Edit User</h1>
    <form action="updateUser" method="post">
        <input type="hidden" name="id" value="${pic.id}"/>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${pic.name}" required/>
        
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="${pic.age}" required/> 
        <label for="schoolId">School:</label> 
        <select id="schoolId" name="schoolId" required>
			<option value="">Select school</option>
			<c:forEach items="${schools}" var="school">
				<option value="${school.id}"
					${pic.school.id == school.id ? 'selected' : ''}>
					${school.name}</option>
			</c:forEach>
		</select>

		<button type="submit">Update</button>
        <button type="button" onclick="window.location.href='manageUser'">Cancel</button>
    </form>
</body>
</html>