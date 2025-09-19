<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | Period Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpHeYAlNEiKOWKD55_0BUaSBmLh0TQGgYLTK-SiQJRbXs6QUsD6WET8hatTQra7g-VHzo&usqp=CAU") no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Transparent overlay for pink shade effect */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(255, 182, 193, 0.5); /* soft pink overlay */
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            background: #fff;
            border-radius: 15px;
            padding: 30px 40px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            width: 380px;
            text-align: center;
        }

        .container h2 {
            color: #cc3366;
            margin-bottom: 20px;
            font-size: 26px;
        }

        .input-group {
            margin: 15px 0;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #444;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #cc3366;
            box-shadow: 0 0 5px rgba(204,51,102,0.5);
        }

        .btn {
            background-color: #cc3366;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
            width: 100%;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #b52d5a;
        }

        .login-link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
            color: #555;
        }

        .login-link a {
            color: #cc3366;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Your Period Tracker Account</h2>
        <form action="RegisterServlet" method="post">
            <div class="input-group">
                <label for="name">Full Name</label>
                <input type="text" name="name" id="name" required>
            </div>

            <div class="input-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>

            <button type="submit" class="btn">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>
