package com.sanjeevmart.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        String message = request.getParameter("message");

        if (message == null || message.trim().isEmpty()) {
            response.getWriter().write(
                "Please enter a message."
            );
            return;
        }

        String userMessage = message.toLowerCase().trim();
        String reply;

        if (userMessage.contains("hello") ||
            userMessage.contains("hi")) {

            reply = "Hello! Welcome to Sanjeev Mart. How can I help you?";

        } else if (userMessage.contains("product")) {

            reply = "You can browse our products from the Home page.";

        } else if (userMessage.contains("cart")) {

            reply = "Click Add to Cart to add a product, then open Cart to view it.";

        } else if (userMessage.contains("order")) {

            reply = "You can check your orders from the My Orders page.";

        } else if (userMessage.contains("payment")) {

            reply = "Sanjeev Mart provides demo payment options for project testing.";

        } else if (userMessage.contains("delivery")) {

            reply = "You can check the latest order status from My Orders.";

        } else {

            reply = "I am Sanjeev Mart Assistant. Ask me about products, cart, orders, payment, or delivery.";
        }

        response.getWriter().write(reply);
    }
}