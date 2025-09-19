package com.period_tacker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class Register extends HttpServlet {
            @Override
            protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            	String name=req.getParameter("name");
            	String email=req.getParameter("email");
            	String password=req.getParameter("password");
            	
            	try {
					Connection c=DbConnection.getConnection();
					PreparedStatement pst=c.prepareStatement("insert into users(name,email,password)values(?,?,?)");
					pst.setString(1,name );
					pst.setString(2, email);
					pst.setString(3, password);
					int result=pst.executeUpdate();
					if(result>0) {
						resp.sendRedirect("login.jsp");
					}else {
						resp.sendRedirect("register.jsp");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					resp.sendRedirect("register.jsp");
				}
            	
            	
            }
}
