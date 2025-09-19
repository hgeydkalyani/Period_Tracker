package com.period_tacker;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DashBoard")
public class DashBoard extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("userId") == null) {
    	    response.sendRedirect("login.jsp");
    	    return;
    	}

    	int userId = (int) session.getAttribute("userId");

    	try {
    	    Connection con = DbConnection.getConnection();
    	    PreparedStatement ps = con.prepareStatement(
    	        "SELECT * FROM period_logs WHERE user_id=? ORDER BY start_date DESC LIMIT 1"
    	    );
    	    ps.setInt(1, userId);
    	    ResultSet rs = ps.executeQuery();

    	    if(rs.next()) {
    	        LocalDate lastStart = rs.getDate("start_date").toLocalDate();
    	        int cycleLength = rs.getInt("cycle_length");
    	        LocalDate nextPeriod = lastStart.plusDays(cycleLength);
    	        LocalDate ovulation = lastStart.plusDays(cycleLength - 14);

    	        request.setAttribute("nextPeriod", nextPeriod.toString());
    	        request.setAttribute("fertileStart", ovulation.minusDays(2).toString());
    	        request.setAttribute("fertileEnd", ovulation.plusDays(2).toString());
    	    } else {
    	        request.setAttribute("nextPeriod", "Not available");
    	        request.setAttribute("fertileStart", "Not available");
    	        request.setAttribute("fertileEnd", "Not available");
    	    }

    	    RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
    	    rd.forward(request, response);

    	    con.close();
    	} catch(Exception e) {
    	    e.printStackTrace();
    	    response.sendRedirect("login.jsp");
    	}
    }
}
