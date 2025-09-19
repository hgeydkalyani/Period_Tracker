<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Single session variable
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Period Log</title>
    <style>
        body {
            background-color: #f8c8dc; /* Baby pink */
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            display: inline-block;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            width: 400px;
        }
        h2 {
            color: #d6336c;
        }
        input, textarea {
            width: 90%;
            padding: 8px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #d6336c;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #b02a55;
        }
        a {
            display: block;
            margin-top: 15px;
            color: #d6336c;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Add Your Period Log 🌸</h2>
        <form action="AddPeriodServlet" method="post">
            Start Date: <input type="date" name="start_date" required><br>
            Duration (days): <input type="number" name="duration" required><br>
            Cycle Length (days): <input type="number" name="cycle_length" required><br>
            Notes: <textarea name="notes" placeholder="Mood, cramps, symptoms..."></textarea><br>
            <input type="submit" value="Add Log">
        </form>
        <a href="DashBoard">Back to Dashboard</a>
    </div>
</body>
</html>
