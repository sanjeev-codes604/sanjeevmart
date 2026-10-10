package com.sanjeevmart.servlet;

import com.sanjeevmart.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
        

            ResultSet rs = ps.executeQuery();
            String storedPassword = null;

if (rs.next()) {
    storedPassword = rs.getString("password");
} 

            if (storedPassword != null &&
    storedPassword.startsWith("$2") &&
    BCrypt.checkpw(password, storedPassword)) {

    HttpSession session = request.getSession();
    session.setAttribute("userEmail", email);
    response.sendRedirect("home.jsp");

} else {
                response.setContentType("text/html");
                response.getWriter().println("<h2>Invalid Email or Password!</h2>");
                response.getWriter().println("<a href='login.jsp'>Try Again</a>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h2>Database Error!</h2>");
            response.getWriter().println("<p>" + e.getMessage() + "</p>");
        }
    }
}