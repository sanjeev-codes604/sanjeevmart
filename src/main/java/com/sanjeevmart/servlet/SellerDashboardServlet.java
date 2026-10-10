package com.sanjeevmart.servlet;

import com.sanjeevmart.Product;
import com.sanjeevmart.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/seller-dashboard")
public class SellerDashboardServlet extends HttpServlet {

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

        request.setAttribute("totalProducts", totalProducts);

        request.getRequestDispatcher("/seller-dashboard.jsp")
               .forward(request, response);
    }
}