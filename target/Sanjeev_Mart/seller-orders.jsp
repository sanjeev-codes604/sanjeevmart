<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Orders - Sanjeev Mart</title>

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
            margin-left: 20px;
        }

        .nav-links a:hover {
            color: #ffb703;
        }

        .container {
            width: 94%;
            max-width: 1300px;
            margin: 45px auto;
        }

        .page-title {
            font-size: 30px;
            margin-bottom: 7px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 28px;
        }

        .table-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 950px;
        }

        th {
            background: #131921;
            color: white;
            text-align: left;
            padding: 14px;
            font-size: 14px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 14px;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .status {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 20px;
            background: #fef3c7;
            color: #92400e;
            font-weight: bold;
            font-size: 12px;
        }

        .update-form {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        select {
            padding: 9px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            background: white;
            outline: none;
        }

        .update-btn {
            border: none;
            background: #ffb703;
            color: #131921;
            padding: 9px 13px;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .update-btn:hover {
            background: #f59e0b;
        }

        .empty {
            text-align: center;
            color: #64748b;
            padding: 35px !important;
        }

        .back-btn {
            display: inline-block;
            margin-top: 22px;
            background: #ffb703;
            color: #131921;
            padding: 11px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        footer {
            text-align: center;
            color: #64748b;
            margin: 50px 0 25px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div class="nav-links">
        <a href="seller-dashboard">Dashboard</a>
        <a href="products">Products</a>
        <a href="home.jsp">Store</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <h1 class="page-title">Seller Orders</h1>

    <p class="subtitle">
        View incoming orders and update their delivery status.
    </p>


    <div class="table-card">

        <table>

            <tr>
                <th>Order ID</th>
                <th>Buyer Email</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Action</th>
            </tr>

<%
    List<String[]> orders =
        (List<String[]>) request.getAttribute("orders");

    if (orders != null && !orders.isEmpty()) {

        for (String[] order : orders) {
%>

            <tr>

                <td>
                    #<%= order[0] %>
                </td>

                <td>
                    <%= order[1] %>
                </td>

                <td>
                    <strong><%= order[2] %></strong>
                </td>

                <td>
                    <%= order[3] %>
                </td>

                <td>
                    <strong>Rs. <%= order[4] %></strong>
                </td>

                <td>
                    <span class="status">
                        <%= order[5] %>
                    </span>
                </td>

                <td>
                    <%= order[6] %>
                </td>

                <td>

                    <form class="update-form"
                          action="update-order-status"
                          method="post">

                        <input
                            type="hidden"
                            name="orderId"
                            value="<%= order[0] %>">

                        <select name="status">

                            <option value="Pending"
                                <%= "Pending".equals(order[5]) ? "selected" : "" %>>
                                Pending
                            </option>

                            <option value="Processing"
                                <%= "Processing".equals(order[5]) ? "selected" : "" %>>
                                Processing
                            </option>

                            <option value="Shipped"
                                <%= "Shipped".equals(order[5]) ? "selected" : "" %>>
                                Shipped
                            </option>

                            <option value="Delivered"
                                <%= "Delivered".equals(order[5]) ? "selected" : "" %>>
                                Delivered
                            </option>

                            <option value="Cancelled"
                                <%= "Cancelled".equals(order[5]) ? "selected" : "" %>>
                                Cancelled
                            </option>

                        </select>

                        <button
                            class="update-btn"
                            type="submit">
                            Update
                        </button>

                    </form>

                </td>

            </tr>

<%
        }

    } else {
%>

            <tr>
                <td class="empty" colspan="8">
                    📦 No orders available.
                </td>
            </tr>

<%
    }
%>

        </table>

    </div>


    <a class="back-btn" href="seller-dashboard">
        ← Back to Seller Dashboard
    </a>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | Seller Order Management
</footer>

</body>
</html>