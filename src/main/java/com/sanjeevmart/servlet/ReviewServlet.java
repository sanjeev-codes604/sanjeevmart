package com.sanjeevmart.servlet;

import com.sanjeevmart.DBConnection;

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

@WebServlet("/submit-review")
public class ReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String buyerEmail = (String) session.getAttribute("userEmail");

        String orderId = request.getParameter("orderId");
        String productName = request.getParameter("productName");
        String ratingValue = request.getParameter("rating");
        String reviewText = request.getParameter("reviewText");

        try {
            int rating = Integer.parseInt(ratingValue);

            if (rating < 1 || rating > 5) {
                response.sendRedirect("order-history");
                return;
            }
            String checkSql =
    "SELECT o.id FROM orders o " +
    "WHERE o.id = ? AND o.buyer_email = ? " +
    "AND o.status = 'Delivered'";
    String duplicateCheckSql =
    "SELECT id FROM reviews " +
    "WHERE order_id = ?";

            String sql =
                "INSERT INTO reviews " +
                "(order_id, buyer_email, product_name, rating, review_text) " +
                "VALUES (?, ?, ?, ?, ?)";

            try (Connection con = DBConnection.getConnection()) {

    // Check: order belongs to this buyer and is Delivered
    try (PreparedStatement checkPs = con.prepareStatement(checkSql)) {

        checkPs.setInt(1, Integer.parseInt(orderId));
        checkPs.setString(2, buyerEmail);

        try (ResultSet rs = checkPs.executeQuery()) {

            if (!rs.next()) {
                response.sendRedirect("order-history");
                return;
            }
        }
    }
// Check if review already submitted
try (PreparedStatement duplicatePs = con.prepareStatement(duplicateCheckSql)) {

    duplicatePs.setInt(1, Integer.parseInt(orderId));

    try (ResultSet rs = duplicatePs.executeQuery()) {

        if (rs.next()) {
            response.sendRedirect("order-history");
            return;
        }
    }
}

    // Save review
    try (PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, Integer.parseInt(orderId));
        ps.setString(2, buyerEmail);
        ps.setString(3, productName);
        ps.setInt(4, rating);
        ps.setString(5, reviewText);

        ps.executeUpdate();
    }
}
            response.sendRedirect("order-history");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("order-history");
        }
    }
}