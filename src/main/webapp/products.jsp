<%@ page import="java.util.List" %>
<%@ page import="com.sanjeevmart.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Sanjeev Mart</title>

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
            max-width: 1200px;
            margin: 45px auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            gap: 20px;
        }

        .header h1 {
            font-size: 30px;
            margin-bottom: 7px;
        }

        .header p {
            color: #64748b;
        }

        .add-btn {
            background: #ffb703;
            color: #131921;
            padding: 12px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            white-space: nowrap;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 22px;
        }

        .product-card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        .product-icon {
            height: 100px;
            background: #f1f5f9;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 45px;
            margin-bottom: 18px;
        }

        .product-card h2 {
            font-size: 21px;
            margin-bottom: 10px;
        }

        .description {
            color: #64748b;
            line-height: 1.5;
            min-height: 45px;
            margin-bottom: 16px;
        }

        .details {
            margin-bottom: 18px;
        }

        .details p {
            margin: 8px 0;
            font-size: 14px;
        }

        .price {
            font-size: 20px !important;
            font-weight: bold;
            color: #111827;
        }

        .stock {
            color: #166534;
            font-weight: bold;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .edit-btn,
        .delete-btn {
            flex: 1;
            text-align: center;
            padding: 10px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .edit-btn {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .delete-btn {
            background: #fee2e2;
            color: #dc2626;
        }

        .empty {
            background: white;
            padding: 60px 20px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        @media(max-width: 650px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
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
        <a href="home.jsp">Store</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <div class="header">

        <div>
            <h1>Product Management</h1>
            <p>Manage your Sanjeev Mart product catalogue.</p>
        </div>

        <a class="add-btn" href="add-product.jsp">
            + Add Product
        </a>

    </div>


<%
    List<Product> products =
        (List<Product>) request.getAttribute("products");

    if (products != null && !products.isEmpty()) {
%>

    <div class="products">

<%
        for (Product product : products) {
%>

        <div class="product-card">

            <div class="product-icon">
                📦
            </div>

            <h2>
                <%= product.getName() %>
            </h2>

            <p class="description">
                <%= product.getDescription() %>
            </p>


            <div class="details">

                <p class="price">
                    Rs. <%= product.getPrice() %>
                </p>

                <p>
                    Stock:
                    <span class="stock">
                        <%= product.getStock() %>
                    </span>
                </p>

                <p>
                    Category:
                    <strong>
                        <%= product.getCategory() %>
                    </strong>
                </p>

            </div>


            <div class="actions">

                <a class="edit-btn"
                   href="edit-product?id=<%= product.getId() %>">
                    Edit
                </a>

                <a class="delete-btn"
                   href="delete-product?id=<%= product.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this product?')">
                    Delete
                </a>

            </div>

        </div>

<%
        }
%>

    </div>

<%
    } else {
%>

    <div class="empty">

        <div class="empty-icon">📦</div>

        <h2>No products available</h2>

        <p style="margin-top:8px; color:#64748b;">
            Add your first product to Sanjeev Mart.
        </p>

        <a class="add-btn"
           style="display:inline-block; margin-top:20px;"
           href="add-product.jsp">
            + Add Product
        </a>

    </div>

<%
    }
%>

</div>

</body>
</html>