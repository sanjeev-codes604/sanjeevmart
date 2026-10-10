package com.sanjeevmart.servlet;
import com.sanjeevmart.Product;
import com.sanjeevmart.ProductDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.sanjeevmart.DBConnection;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
ProductDAO productDAO = new ProductDAO();
List<Product> products = productDAO.getAllProducts();

int totalProducts = products.size();
int totalUsers = 0;

String sql = "SELECT COUNT(*) FROM users";

try (Connection con = DBConnection.getConnection();
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery()) {

    if (rs.next()) {
        totalUsers = rs.getInt(1);
    }

} catch (Exception e) {
    e.printStackTrace();
}

request.setAttribute("totalUsers", totalUsers);
request.setAttribute("totalProducts", totalProducts);
        request.getRequestDispatcher("/admin-dashboard.jsp")
               .forward(request, response);
    }
}