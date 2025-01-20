<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <title>Edit User</title>
   <style>
       :root {
           --primary-color: #28a745;
           --danger-color: #dc3545; 
           --background-color: #f5f6fa;
           --form-background: #ffffff;
           --text-color: #2c3e50;
       }

       body {
           font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           margin: 0;
           padding: 2rem;
           background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
           min-height: 100vh;
           display: flex;
           flex-direction: column;
           align-items: center;
       }

       h1 {
           color: var(--text-color);
           font-size: 2.5rem;
           margin-bottom: 2rem;
           text-align: center;
           font-weight: 600;
           text-shadow: 0 2px 4px rgba(0,0,0,0.1);
       }

       form {
           width: 100%;
           max-width: 600px;
           background: var(--form-background);
           padding: 2.5rem;
           border-radius: 15px;
           box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
           margin: 0 auto;
       }

       .form-group {
           margin-bottom: 1.5rem;
       }

       label {
           display: block;
           font-weight: 500;
           margin-bottom: 0.5rem;
           color: var(--text-color);
           font-size: 1.1rem;
       }

       input, select {
           width: 100%;
           padding: 0.8rem 1rem;
           border: 2px solid #e1e1e1;
           border-radius: 8px;
           font-size: 1rem;
           transition: all 0.3s ease;
           box-sizing: border-box;
           margin-bottom: 1.5rem;
       }

       input:focus, select:focus {
           outline: none;
           border-color: var(--primary-color);
           box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.2);
       }

       select {
           appearance: none;
           background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%232c3e50' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
           background-repeat: no-repeat;
           background-position: right 1rem center;
           background-size: 1em;
           padding-right: 2.5rem;
       }

       .button-group {
           display: flex;
           gap: 1rem;
           margin-top: 2rem;
       }

       button {
           flex: 1;
           padding: 1rem 1.5rem;
           border: none;
           border-radius: 8px;
           font-size: 1rem;
           font-weight: 500;
           cursor: pointer;
           transition: all 0.3s ease;
           text-transform: uppercase;
           letter-spacing: 0.5px;
       }

       button[type="submit"] {
           background-color: var(--primary-color);
           color: white;
       }

       button[type="submit"]:hover {
           background-color: #218838;
           transform: translateY(-2px);
           box-shadow: 0 4px 12px rgba(40, 167, 69, 0.2);
       }

       button[type="button"] {
           background-color: var(--danger-color);
           color: white;
       }

       button[type="button"]:hover {
           background-color: #c82333;
           transform: translateY(-2px);
           box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2);
       }

       @media (max-width: 768px) {
           body {
               padding: 1rem;
           }

           form {
               padding: 1.5rem;
           }

           .button-group {
               flex-direction: column;
           }

Hadi UTM, [21/1/2025 4:40 AM]
button {
               width: 100%;
           }
       }
   </style>
</head>
<body>
   <h1>Edit User</h1>
   <form action="updateUser" method="post">
       <input type="hidden" name="id" value="${pic.id}"/>
       
       <div class="form-group">
           <label for="name">Name</label>
           <input type="text" id="name" name="name" value="${pic.name}" required/>
       </div>
       
       <div class="form-group">
           <label for="age">Age</label>
           <input type="number" id="age" name="age" value="${pic.age}" required/>
       </div>
       
       <div class="form-group">
           <label for="schoolId">School</label>
           <select id="schoolId" name="schoolId" required>
               <option value="">Select school</option>
               <c:forEach items="${schools}" var="school">
                   <option value="${school.id}" ${pic.school.id == school.id ? 'selected' : ''}>
                       ${school.name}
                   </option>
               </c:forEach>
           </select>
       </div>

       <div class="button-group">
           <button type="submit">Update</button>
           <button type="button" onclick="window.location.href='manageUser'">Cancel</button>
       </div>
   </form>
</body>
</html>