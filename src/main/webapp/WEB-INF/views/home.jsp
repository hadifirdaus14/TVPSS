<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>TVPSS SYSTEM</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        p {
            text-align: center;
            color: #34495e;
            font-size: 1.2rem;
            margin-bottom: 3rem;
        }

        nav {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-top: 2rem;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: center;
        }

        li {
            margin: 0.5rem;
        }

        a {
            display: inline-block;
            padding: 1rem 2rem;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
            min-width: 150px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.2);
        }

        a:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            h1 {
                font-size: 2rem;
            }

            ul {
                flex-direction: column;
                align-items: center;
            }

            li {
                width: 100%;
                max-width: 300px;
            }

            a {
                width: 100%;
                box-sizing: border-box;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${message}</h1>
        <p>Welcome to the TVPSS System!</p>
        
        <nav>
            <ul>
                <li><a href="manageSchool">School List (Admin)</a></li>
                <li><a href="manageSchoolInfo">School List (PIC/Crew)</a></li>
                <li><a href="manageUser">Manage Users</a></li>
                <li><a href="manageResource">Manage Resource</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>