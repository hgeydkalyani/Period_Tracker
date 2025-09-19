package com.period_tacker;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        List<PeriodLog> logs = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM period_logs WHERE user_id=? ORDER BY start_date DESC"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                PeriodLog log = new PeriodLog();
                log.setStartDate(rs.getDate("start_date").toString());
                log.setDuration(rs.getInt("duration"));
                log.setCycleLength(rs.getInt("cycle_length"));
                log.setNotes(rs.getString("notes"));
                logs.add(log);
            }

            request.setAttribute("logs", logs);
            RequestDispatcher rd = request.getRequestDispatcher("history.jsp");
            rd.forward(request, response);

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp");
        }
    }
}
