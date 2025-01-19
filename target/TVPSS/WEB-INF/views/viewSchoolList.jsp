<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>School Information</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #ddd;
        }
        button:active {
            background-color: #ccc;
        }
        input {
            padding: 8px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h1>School Information</h1>
    <div>
        <input type="text" id="searchInput" placeholder="Search by name or district" onkeyup="searchSchool()" />
    </div>
    <div style="overflow-x: auto;">
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
                <c:choose>
                    <c:when test="${not empty schools}">
                        <c:forEach var="school" items="${schools}">
                            <tr>
                                <td>${school.id}</td>
                                <td>${school.code}</td>
                                <td>${school.name}</td>
                                <td>${school.type}</td>
                                <td>${school.district}</td>
                                <td>
                                    <button onclick="editSchool(${school.id})">Edit</button>
                                    <button onclick="deleteSchool(${school.id})">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" style="text-align: center;">No schools found.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <script>
        function searchSchool() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.querySelector('table');
            const rows = table.getElementsByTagName('tr');
            for (let i = 1; i < rows.length; i++) {
                const name = rows[i].getElementsByTagName('td')[2].textContent.toLowerCase();
                const district = rows[i].getElementsByTagName('td')[4].textContent.toLowerCase();
                rows[i].style.display = name.includes(filter) || district.includes(filter) ? '' : 'none';
            }
        }
    </script>
</body>
</html>
