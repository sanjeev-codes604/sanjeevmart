<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Sanjeev Mart</title>

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
            margin-bottom: 40px;
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
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .stat-number {
            font-size: 31px;
            font-weight: bold;
        }

        .section-title {
            font-size: 23px;
            margin-bottom: 20px;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
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
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        .action-icon {
            font-size: 38px;
            margin-bottom: 15px;
        }

        .action-card h3 {
            margin-bottom: 9px;
        }

        .action-card p {
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .action-btn {
            display: inline-block;
            background: #ffb703;
            color: #131921;
            padding: 10px 17px;
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

    <div class="nav-links">
        <a href="home.jsp">Store</a>
        <a href="products">Products</a>
        <a href="users">Users</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <div class="welcome">

        <h1>Admin Dashboard</h1>

        <p>
            Welcome Admin! Manage Sanjeev Mart from one place.
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


        <div class="stat-card">

            <div class="stat-icon">👥</div>

            <div class="stat-title">
                TOTAL USERS
            </div>

            <div class="stat-number">
                ${totalUsers}
            </div>

        </div>

    </div>


    <h2 class="section-title">
        Admin Management
    </h2>


    <div class="actions">

        <div class="action-card">

            <div class="action-icon">🛍️</div>

            <h3>Manage Products</h3>

            <p>
                View, add, edit and delete products
                available in Sanjeev Mart.
            </p>

            <a class="action-btn" href="products">
                Manage Products
            </a>

        </div>


        <div class="action-card">

            <div class="action-icon">👥</div>

            <h3>Manage Users</h3>

            <p>
                View registered users and manage
                Sanjeev Mart user information.
            </p>

            <a class="action-btn" href="users">
                Manage Users
            </a>

        </div>


        <div class="action-card">

            <div class="action-icon">📊</div>

            <h3>Seller Dashboard</h3>

            <p>
                Open the seller area and manage
                product operations.
            </p>

            <a class="action-btn" href="seller-dashboard">
                Seller Dashboard
            </a>

        </div>


        <div class="action-card">

            <div class="action-icon">🏪</div>

            <h3>View Store</h3>

            <p>
                Visit the customer-facing Sanjeev Mart
                shopping page.
            </p>

            <a class="action-btn" href="home.jsp">
                View Store
            </a>

        </div>

    </div>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | Admin Dashboard
</footer>

</body>
</html>