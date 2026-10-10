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
import java.util.List;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String payment = request.getParameter("payment");

        String buyerEmail =
                (String) session.getAttribute("userEmail");

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String findProductSql =
                "SELECT id, price FROM products " +
                "WHERE LOWER(name) = LOWER(?)";

        String insertOrderSql =
                "INSERT INTO orders " +
                "(buyer_email, product_id, quantity, total_price, status) " +
                "VALUES (?, ?, ?, ?, 'Pending')";

        try (Connection con = DBConnection.getConnection()) {

            for (String productName : cart) {

                try (PreparedStatement productPs =
                             con.prepareStatement(findProductSql)) {

                    productPs.setString(1, productName);

                    try (ResultSet rs = productPs.executeQuery()) {

                        if (rs.next()) {

                            int productId = rs.getInt("id");
                            double price = rs.getDouble("price");

                            try (PreparedStatement orderPs =
                                     con.prepareStatement(insertOrderSql)) {

                                orderPs.setString(1, buyerEmail);
                                orderPs.setInt(2, productId);
                                orderPs.setInt(3, 1);
                                orderPs.setDouble(4, price);

                                orderPs.executeUpdate();
                            }
                        }
                    }
                }
            }
        cart.clear();
        session.setAttribute("cart", cart);
        response.sendRedirect("order-history");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp");
            return;
        }
    }
}