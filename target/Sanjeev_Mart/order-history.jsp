<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - Sanjeev Mart</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f7fa;
            color: #1f2937;
            min-height: 100vh;
        }

        .navbar {
            background: #131921;
            color: white;
            padding: 16px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
        }

        .logo span {
            color: #ffb703;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 22px;
        }

        .nav-links a:hover {
            color: #ffb703;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .title {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 28px;
        }

        .order-box {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #131921;
            color: white;
            text-align: left;
            padding: 15px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .status {
            display: inline-block;
            background: #dcfce7;
            color: #166534;
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 55px 20px;
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty h3 {
            margin-bottom: 8px;
        }

        .empty p {
            color: #64748b;
        }

        .home-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 20px;
            background: #ffb703;
            color: #131921;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .home-btn:hover {
            background: #f59e0b;
        }

        footer {
            text-align: center;
            color: #64748b;
            margin: 50px 0 25px;
            font-size: 13px;
        }
        .review-form {
    min-width: 230px;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.review-form select,
.review-form textarea {
    width: 100%;
    padding: 9px 10px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    font-family: Arial, sans-serif;
    outline: none;
}

.review-form select:focus,
.review-form textarea:focus {
    border-color: #ffb703;
}

.review-form textarea {
    resize: vertical;
    min-height: 65px;
}

.review-form button {
    border: none;
    background: #ffb703;
    color: #131921;
    padding: 10px;
    border-radius: 7px;
    font-weight: bold;
    cursor: pointer;
}

.review-form button:hover {
    background: #f59e0b;
}
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="seller-dashboard">Seller Dashboard</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <h1 class="title">My Orders</h1>

    <p class="subtitle">
        View and track your Sanjeev Mart order history.
    </p>


    <div class="order-box">

    <%
        List<String[]> orders =
            (List<String[]>) request.getAttribute("orders");

        if (orders != null && !orders.isEmpty()) {
    %>

        <table>

            <tr>
                <th>Order ID</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Review & Rating</th>
            </tr>

            <%
                for (String[] order : orders) {
            %>

            <tr>
                <td>#<%= order[0] %></td>

                <td>
                    <strong><%= order[1] %></strong>
                </td>

                <td><%= order[2] %></td>

                <td>
                    Rs. <%= order[3] %>
                </td>

                <td>
                    <span class="status">
                        <%= order[4] %>
                    </span>
                </td>

                <td><%= order[5] %></td>
                <td>
    <% if ("Delivered".equalsIgnoreCase(order[4])) { %>
<% if (order[6] != null) { %>

    <div class="submitted-review">
        <strong>⭐ <%= order[6] %>/5</strong>
        <p><%= order[7] %></p>
        <span>✓ Review Submitted</span>
    </div>

<% } else { %>
        <form action="submit-review" method="post" class="review-form">

            <input type="hidden"
                   name="orderId"
                   value="<%= order[0] %>">

            <input type="hidden"
                   name="productName"
                   value="<%= order[1] %>">

            <select name="rating" required>
                <option value="">Select Rating</option>
                <option value="5">⭐⭐⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
                <option value="2">⭐⭐</option>
                <option value="1">⭐</option>
            </select>

            <textarea name="reviewText"
                      placeholder="Write your review..."
                      maxlength="500"
                      required></textarea>

            <button type="submit">
                Submit Review
            </button>

        </form>
     <% } %>
    <% } else { %>

        <span>Available after delivery</span>

    <% } %>
</td>   
            </tr>

            <%
                }
            %>

        </table>

    <%
        } else {
    %>

        <div class="empty">

            <div class="empty-icon">📦</div>

            <h3>No orders found</h3>

            <p>
                You haven't placed any orders yet.
            </p>

            <a class="home-btn" href="home.jsp">
                Start Shopping
            </a>

        </div>

    <%
        }
    %>

    </div>

    <%
        if (orders != null && !orders.isEmpty()) {
    %>

        <a class="home-btn" href="home.jsp">
            ← Back to Home
        </a>

    <%
        }
    %>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | My Orders
</footer>

</body>
</html>