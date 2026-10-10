<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Sanjeev Mart</title>

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

        /* NAVBAR */
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
            margin-left: 22px;
        }

        .navbar a:hover {
            color: #ffb703;
        }

        /* PAGE */
        .container {
            width: 88%;
            max-width: 950px;
            margin: 45px auto;
        }

        .page-title {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 28px;
        }

        /* CART BOX */
        .cart-box {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px;
            border-bottom: 1px solid #e5e7eb;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .product-icon {
            width: 50px;
            height: 50px;
            background: #f1f5f9;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
        }

        .product-name {
            font-size: 17px;
            font-weight: bold;
        }

        .remove-btn {
            border: none;
            background: #fee2e2;
            color: #dc2626;
            padding: 9px 15px;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .remove-btn:hover {
            background: #fecaca;
        }

        /* EMPTY CART */
        .empty-cart {
            text-align: center;
            padding: 55px 20px;
        }

        .empty-icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .empty-cart h3 {
            font-size: 22px;
            margin-bottom: 8px;
        }

        .empty-cart p {
            color: #64748b;
        }

        /* BUTTON */
        .continue-btn {
            display: inline-block;
            margin-top: 25px;
            background: #ffb703;
            color: #131921;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .continue-btn:hover {
            background: #f59e0b;
        }

        footer {
            text-align: center;
            color: #64748b;
            margin: 50px 0 25px;
            font-size: 13px;
        }

        @media(max-width: 600px) {
            .cart-item {
                gap: 15px;
            }

            .container {
                width: 94%;
            }
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div>
        <a href="home.jsp">Home</a>
        <a href="order-history">My Orders</a>
        <a href="logout">Logout</a>
    </div>

</div>


<div class="container">

    <h1 class="page-title">Your Shopping Cart</h1>

    <p class="subtitle">
        Review the products you added to your cart.
    </p>

    <div class="cart-box">

<%
    List<String> cart =
        (List<String>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>

        <div class="empty-cart">

            <div class="empty-icon">🛒</div>

            <h3>Your cart is empty!</h3>

            <p>
                Add some products and they will appear here.
            </p>

            <a class="continue-btn" href="home.jsp">
                Continue Shopping
            </a>

        </div>

<%
    } else {

        for (String product : cart) {
%>

        <div class="cart-item">

            <div class="product-info">

                <div class="product-icon">
                    📦
                </div>

                <div class="product-name">
                    <%= product %>
                </div>

            </div>


            <form action="remove-cart" method="post">

                <input
                    type="hidden"
                    name="product"
                    value="<%= product %>">

                <button
                    class="remove-btn"
                    type="submit">
                    Remove
                </button>

            </form>

        </div>

<%
        }
    }
%>

    </div>


<%
    if (cart != null && !cart.isEmpty()) {
%>

    <a class="continue-btn" href="home.jsp">
        ← Continue Shopping
    </a>
    <a class="continue-btn" href="checkout.jsp">
    Proceed to Checkout →
</a>

<%
    }
%>

</div>


<footer>
    &copy; 2026 Sanjeev Mart | Shopping Cart
</footer>

</body>
</html>