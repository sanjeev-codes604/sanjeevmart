package com.sanjeevmart.servlet;

import com.sanjeevmart.Product;
import com.sanjeevmart.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(id);

        request.setAttribute("product", product);

        request.getRequestDispatcher("/edit-product.jsp")
               .forward(request, response);
    }
    @Override
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));
    String category = request.getParameter("category");
    String imageUrl = request.getParameter("imageUrl");

    Product product = new Product();

    product.setId(id);
    product.setName(name);
    product.setDescription(description);
    product.setPrice(price);
    product.setStock(stock);
    product.setCategory(category);
    product.setImageUrl(imageUrl);

    ProductDAO productDAO = new ProductDAO();
    productDAO.updateProduct(product);

    response.sendRedirect("products");
}
}