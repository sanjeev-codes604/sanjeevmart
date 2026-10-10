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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/order-history")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String buyerEmail = (String) session.getAttribute("userEmail");

        List<String[]> orders = new ArrayList<>();

       String sql = "SELECT o.id, p.name, o.quantity, o.total_price, " +
             "o.status, o.order_date, r.rating, r.review_text " +
             "FROM orders o " +
             "JOIN products p ON o.product_id = p.id " +
             "LEFT JOIN reviews r ON o.id = r.order_id " +
             "WHERE o.buyer_email = ? " +
             "ORDER BY o.order_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, buyerEmail);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    String[] order = new String[8];

                    order[0] = rs.getString("id");
                    order[1] = rs.getString("name");
                    order[2] = rs.getString("quantity");
                    order[3] = rs.getString("total_price");
                    order[4] = rs.getString("status");
                    order[5] = rs.getString("order_date");
                    order[6] = rs.getString("rating");
                    order[7] = rs.getString("review_text");

                    orders.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("order-history.jsp")
               .forward(request, response);
    }
}