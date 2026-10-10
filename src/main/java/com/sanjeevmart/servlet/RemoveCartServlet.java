package com.sanjeevmart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/remove-cart")
public class RemoveCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String product = request.getParameter("product");

        HttpSession session = request.getSession();

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        if (cart != null && product != null) {
            cart.remove(product);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}