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

@WebServlet("/seller-orders")
public class SellerOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> orders = new ArrayList<>();

        String sql =
            "SELECT o.id, o.buyer_email, p.name, o.quantity, " +
            "o.total_price, o.status, o.order_date " +
            "FROM orders o JOIN products p ON o.product_id = p.id " +
            "ORDER BY o.order_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(new String[] {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("buyer_email"),
                    rs.getString("name"),
                    String.valueOf(rs.getInt("quantity")),
                    String.valueOf(rs.getDouble("total_price")),
                    rs.getString("status"),
                    String.valueOf(rs.getTimestamp("order_date"))
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/seller-orders.jsp")
               .forward(request, response);
    }
}
