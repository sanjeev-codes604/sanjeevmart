package com.sanjeevmart.servlet;

import com.sanjeevmart.Product;
import com.sanjeevmart.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("imageUrl");

        Product product = new Product();

        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setCategory(category);
        product.setImageUrl(imageUrl);

        ProductDAO productDAO = new ProductDAO();

        boolean added = productDAO.addProduct(product);

        if (added) {
            response.sendRedirect(request.getContextPath() + "/products");
        } else {
            response.getWriter().println("Failed to add product.");
        }
    }
}
