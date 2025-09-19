<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<%@ page import="com.period_tacker.PeriodLog"%>
<%
    HttpSession session3 = request.getSession(false);
    if(session3 == null || session3.getAttribute("userId") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    List<PeriodLog> logs = (List<PeriodLog>) request.getAttribute("logs");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Period History</title>
    <style>
        body { background-color: #f8c8dc; font-family: Arial, sans-serif; text-align: center; padding: 30px; }
        table { border-collapse: collapse; margin: auto; background: white; width: 80%; box-shadow: 0 4px 10px rgba(0,0,0,0.2);}
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #d6336c; color: white; }
        a { display: inline-block; margin: 15px; padding: 10px 20px; background: #d6336c; color: white; border-radius: 8px; text-decoration: none; }
        a:hover { background: #b02a55; }
    </style>
</head>
<body>
    <h2>Period History 🌸</h2>
    <table>
        <tr>
            <th>Start Date</th>
            <th>Duration (days)</th>
            <th>Cycle Length (days)</th>
            <th>Notes</th>
        </tr>
        <%
            if(logs != null && !logs.isEmpty()) {
                for(PeriodLog log : logs) {
        %>
        <tr>
            <td><%= log.getStartDate() %></td>
            <td><%= log.getDuration() %></td>
            <td><%= log.getCycleLength() %></td>
            <td><%= log.getNotes() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4">No period logs found.</td></tr>
        <%
            }
        %>
    </table>
    <a href="DashBoard">Back to Dashboard</a>
</body>
</html>
