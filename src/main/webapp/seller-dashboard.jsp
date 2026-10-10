<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard - Sanjeev Mart</title>

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

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        .navbar a:hover {
            color: #ffb703;
        }

        .container {
            width: 88%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .welcome {
            margin-bottom: 30px;
        }

        .welcome h1 {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .welcome p {
            color: #64748b;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
        }

        .stat-icon {
            font-size: 35px;
            margin-bottom: 12px;
        }

        .stat-title {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .stat-number {
            font-size: 30px;
            font-weight: bold;
        }

        .section-title {
            font-size: 23px;
            margin-bottom: 18px;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .action-card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .action-card:hover {
            transform: translateY(-4px);
        }

        .action-icon {
            font-size: 38px;
            margin-bottom: 15px;
        }

        .action-card h3 {
            margin-bottom: 8px;
        }

        .action-card p {
            color: #64748b;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .action-btn {
            display: inline-block;
            background: #ffb703;
            color: #131921;
            padding: 11px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .action-btn:hover {
            background: #f59e0b;
        }

        footer {
            text-align: center;
            color: #64748b;
            margin: 55px 0 25px;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div>
        <a href="home.jsp">Store</a>
        <a href="products">Products</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <div class="welcome">
        <h1>Seller Dashboard</h1>
        <p>
            Welcome Seller! Manage your Sanjeev Mart products here.
        </p>
    </div>


    <div class="stats">

        <div class="stat-card">

            <div class="stat-icon">📦</div>

            <div class="stat-title">
                TOTAL PRODUCTS
            </div>

            <div class="stat-number">
                ${totalProducts}
            </div>

        </div>

    </div>


    <h2 class="section-title">
        Product Management
    </h2>


    <div class="actions">

        <div class="action-card">

            <div class="action-icon">🛍️</div>

            <h3>View Products</h3>

            <p>
                View and manage all products currently
                available in Sanjeev Mart.
            </p>

            <a class="action-btn" href="products">
                View Products
            </a>

        </div>


        <div class="action-card">

            <div class="action-icon">➕</div>

            <h3>Add New Product</h3>

            <p>
                Add a new product to the Sanjeev Mart
                product catalogue.
            </p>

            <a class="action-btn" href="add-product.jsp">
                Add Product
            </a>

        </div>

    </div>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | Seller Dashboard
</footer>

</body>
</html>