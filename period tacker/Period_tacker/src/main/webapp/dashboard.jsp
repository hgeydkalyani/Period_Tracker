<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String name = (String) session1.getAttribute("name");
    String nextPeriod = (String) request.getAttribute("nextPeriod"); // YYYY-MM-DD
    String fertileStart = (String) request.getAttribute("fertileStart"); // YYYY-MM-DD
    String fertileEnd = (String) request.getAttribute("fertileEnd");     // YYYY-MM-DD
    Integer periodLength = (Integer) request.getAttribute("periodLength"); // e.g., 5 days
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body { background-color: #f8c8dc; font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .box { background: white; padding: 25px; border-radius: 15px; display: inline-block; box-shadow: 0 4px 10px rgba(0,0,0,0.2); width: 400px; margin-bottom: 30px; }
        h2 { color: #d6336c; }
        .info { margin: 15px 0; font-size: 16px; color: #333; }
        a.button { display: inline-block; margin: 10px; padding: 10px 20px; background: #d6336c; color: white; border-radius: 8px; text-decoration: none; }
        a.button:hover { background: #b02a55; }
        #calendar { display: grid; grid-template-columns: repeat(7, 1fr); gap: 5px; margin-top: 15px; }
        .day { padding: 10px; background: #f0f0f0; border-radius: 5px; text-align: center; }
        .period-day { background: #ff6b81; color: white; }
        .fertile-day { background: #74c0fc; color: white; }
        .today { border: 2px solid #d6336c; }
    </style>
</head>
<body>
    <!-- Welcome Box -->
    <div class="box">
        <h2>Welcome, <%= name %> 🌸</h2>
        <p class="info">Next Period: <%= (nextPeriod != null) ? nextPeriod : "Not available" %></p>
        <p class="info">Fertile Window: 
            <%= (fertileStart != null && fertileEnd != null) ? fertileStart + " to " + fertileEnd : "Not available" %>
        </p>
        <a class="button" href="addperiod.jsp">Add Period Log</a>
        <a class="button" href="HistoryServlet">View History</a>
        <a class="button" href="LogoutServlet">Logout</a>
    </div>

    <!-- Calendar Box -->
    <div class="box">
        <h2>Period & Fertility Calendar 🌸</h2>
        <div id="calendar"></div>
    </div>

    <!-- Safe Calendar Script -->
    <script>
        // Safe embedding of JSP variables
        const nextPeriod = "<%= (nextPeriod != null ? nextPeriod.replace("\"","\\\"") : "") %>";
        const fertileStart = "<%= (fertileStart != null ? fertileStart.replace("\"","\\\"") : "") %>";
        const fertileEnd = "<%= (fertileEnd != null ? fertileEnd.replace("\"","\\\"") : "") %>";
        const periodLength = <%= (periodLength != null ? periodLength.intValue() : 5) %>;

        const calendarDiv = document.getElementById('calendar');
        const today = new Date();
        const year = today.getFullYear();
        const month = today.getMonth();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        const periodStart = nextPeriod ? new Date(nextPeriod) : null;
        const fertileStartDate = fertileStart ? new Date(fertileStart) : null;
        const fertileEndDate = fertileEnd ? new Date(fertileEnd) : null;

        for (let day = 1; day <= daysInMonth; day++) {
            const date = new Date(year, month, day);
            const dayDiv = document.createElement('div');
            dayDiv.classList.add('day');
            dayDiv.innerText = day;

            // Highlight period days
            if (periodStart) {
                const periodEnd = new Date(periodStart);
                periodEnd.setDate(periodEnd.getDate() + periodLength - 1);
                if (date >= periodStart && date <= periodEnd) {
                    dayDiv.classList.add('period-day');
                }
            }

            // Highlight fertile days
            if (fertileStartDate && fertileEndDate && date >= fertileStartDate && date <= fertileEndDate) {
                dayDiv.classList.add('fertile-day');
            }

            // Highlight today
            if (date.toDateString() === today.toDateString()) {
                dayDiv.classList.add('today');
            }

            calendarDiv.appendChild(dayDiv);
        }
    </script>
</body>
</html>
