<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add School</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --danger-color: #e74c3c;
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
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.2);
        }

        input::placeholder {
            color: #a0aec0;
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
            background-color: #357abd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(74, 144, 226, 0.2);
        }

        .cancel {
            background-color: var(--danger-color);
            color: white;
        }

        .cancel:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(231, 76, 60, 0.2);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%232c3e50' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
            padding-right: 2.5rem;
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

            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1>Add New School</h1>
    <form action="addSchool${school}" method="post">
        <div class="form-group">
            <label for="code">School Code</label>
            <input type="text" id="code" name="code" placeholder="Enter school code" required />
        </div>

        <div class="form-group">
            <label for="name">School Name</label>
            <input type="text" id="name" name="name" placeholder="Enter school name" required />
        </div>

        <div class="form-group">
            <label for="type">School Type</label>
            <select id="type" name="type" required>
                <option value="">Select type</option>
                <option value="Primary School">Primary School</option>
                <option value="Secondary School">Secondary School</option>
            </select>
        </div>

        <div class="form-group">
            <label for="district">District</label>
            <input type="text" id="district" name="district" placeholder="Enter district" required />
        </div>

        <div class="button-group">
            <button type="submit">Add School</button>
            <button type="button" class="cancel" onclick="window.location.href='/manageSchoolInfo';">Cancel</button>
        </div>
    </form>
</body>
</html>