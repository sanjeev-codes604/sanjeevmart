<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Management - Sanjeev Mart</title>

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
            width: 90%;
            max-width: 1000px;
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
            padding: 22px;
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
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .user-name {
            font-weight: bold;
        }

        .email {
            color: #64748b;
        }

        .delete-btn {
            display: inline-block;
            background: #fee2e2;
            color: #dc2626;
            padding: 8px 14px;
            border-radius: 7px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .delete-btn:hover {
            background: #fecaca;
        }

        .empty {
            text-align: center;
            padding: 40px !important;
            color: #64748b;
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
        <a href="admin-dashboard">Dashboard</a>
        <a href="products">Products</a>
        <a href="home.jsp">Store</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <h1 class="page-title">Users Management</h1>

    <p class="subtitle">
        View and manage registered Sanjeev Mart users.
    </p>


    <div class="table-card">

        <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

<%
    List<String[]> users =
        (List<String[]>) request.getAttribute("users");

    if (users != null && !users.isEmpty()) {

        for (String[] user : users) {
%>

            <tr>

                <td class="user-name">
                    👤 <%= user[0] %>
                </td>

                <td class="email">
                    <%= user[1] %>
                </td>

                <td>

                    <a class="delete-btn"
                       href="delete-user?email=<%= user[1] %>"
                       onclick="return confirm('Are you sure you want to delete this user?')">
                        Delete
                    </a>

                </td>

            </tr>

<%
        }

    } else {
%>

            <tr>
                <td class="empty" colspan="3">
                    👥 No registered users found.
                </td>
            </tr>

<%
    }
%>

        </table>

    </div>


    <a class="back-btn" href="admin-dashboard">
        ← Back to Admin Dashboard
    </a>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | User Management
</footer>

</body>
</html>