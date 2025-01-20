<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add School</title>
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
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
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
    <h1>Add New School</h1>
    <form action="addSchool" method="post">
        <label for="code">School Code:</label>
        <input type="text" id="code" name="code" placeholder="Enter school code" required />

        <label for="name">School Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter school name" required />

        <label for="type">School Type:</label>
        <select id="type" name="type" required>
            <option value="">Select type</option>
            <option value="Primary School">Primary School</option>
            <option value="Secondary School">Secondary School</option>
        </select>
        
        <label for="district">District:</label>
        <input type="text" id="district" name="district" placeholder="Enter district" required />

        <button type="submit">Add School</button>
        <button type="button" class="cancel" onclick="window.location.href='/manageSchoolInfo';">Cancel</button>
    </form>
</body>
</html>
