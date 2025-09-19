package com.period_tacker;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddPeriodServlet")
public class AddPeriodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String startDate = request.getParameter("start_date");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int cycleLength = Integer.parseInt(request.getParameter("cycle_length"));
        String notes = request.getParameter("notes");

        try (Connection con = DbConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO period_logs(user_id, start_date, duration, cycle_length, notes) VALUES(?,?,?,?,?)"
            );
            ps.setInt(1, userId);
            ps.setString(2, startDate);
            ps.setInt(3, duration);
            ps.setInt(4, cycleLength);
            ps.setString(5, notes);
            ps.executeUpdate();

            // After adding, go back to dashboard
            response.sendRedirect("DashBoard");

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("addPeriod.jsp");
        }
    }
}
