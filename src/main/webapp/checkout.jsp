<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.sanjeevmart.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Sanjeev Mart</title>

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

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
        }

        h1 {
            margin-bottom: 25px;
        }

        .checkout-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }

        .box {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .box h2 {
            margin-bottom: 20px;
            font-size: 20px;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
        }

        input, textarea, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
        }

        textarea {
            min-height: 80px;
            resize: vertical;
        }

        .payment-option {
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
        }

        .payment-option input {
            width: auto;
            margin-right: 8px;
        }

        .place-order {
            width: 100%;
            margin-top: 20px;
            border: none;
            background: #ffb703;
            color: #131921;
            padding: 14px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .place-order:hover {
            background: #f59e0b;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            color: #1f2937;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 700px) {
            .checkout-grid {
                grid-template-columns: 1fr;
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
        <a href="cart.jsp">Cart</a>
        <a href="order-history">My Orders</a>
    </div>
</div>

<div class="container">

    <h1>Secure Checkout</h1>

    <form action="place-order" method="post">

        <div class="checkout-grid">

            <div class="box">
                <h2>📍 Delivery Address</h2>

                <label>Full Name</label>
                <input type="text" name="fullName" required>

                <label>Phone Number</label>
                <input type="tel" name="phone" required>

                <label>Address</label>
                <textarea name="address" required></textarea>

                <label>City</label>
                <input type="text" name="city" required>

                <label>PIN Code</label>
                <input type="text" name="pincode" required>
            </div>
           
       <div class="box">
    <h2>Order Summary</h2>

    <%
        List<String> checkoutCart =
            (List<String>) session.getAttribute("cart");

        double grandTotal = 0;

        if (checkoutCart != null && !checkoutCart.isEmpty()) {

            try (Connection con = DBConnection.getConnection()) {

                String sql =
                    "SELECT price FROM products WHERE LOWER(name) = LOWER(?)";

                for (String item : checkoutCart) {

                    try (PreparedStatement ps = con.prepareStatement(sql)) {

                        ps.setString(1, item);

                        try (ResultSet rs = ps.executeQuery()) {

                            if (rs.next()) {
                                double price = rs.getDouble("price");
                                grandTotal += price;
    %>

        <div style="padding:10px 0; border-bottom:1px solid #ddd;">
            <strong><%= item %></strong>
            <span style="float:right;">
                Rs. <%= String.format("%.2f", price) %>
            </span>
            <br>
            <small>Qty: 1</small>
        </div>

    <%
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
    %>

        <div style="margin-top:20px; font-size:20px; font-weight:bold;">
            Total:
            <span style="float:right;">
                Rs. <%= String.format("%.2f", grandTotal) %>
            </span>
        </div>

    <%
        } else {
    %>

        <p>Your cart is empty.</p>

    <%
        }
    %>

</div>
            <div class="box">
                <h2>💳 Payment Method</h2>

                <div class="payment-option">
                  <input type="radio" name="payment" value="COD"
       onclick="showPaymentFields('cod')" required>
                    Cash on Delivery
                </div>

                <div class="payment-option">
    <input type="radio" name="payment" value="UPI"
           onclick="showPaymentFields('upi')">
    UPI

    <div id="upiFields" style="display:none; margin-top:12px;">
        <label>Enter UPI ID</label>
        <input type="text"
               name="upiId"
               placeholder="example@upi">
    </div>
</div>
               <div class="payment-option">
    <input type="radio" name="payment" value="Card"
           onclick="showPaymentFields('card')">
    Credit / Debit Card

    <div id="cardFields" style="display:none; margin-top:12px;">
        <label>Card Number</label>
        <input type="text"
               name="cardNumber"
               placeholder="XXXX XXXX XXXX XXXX">

        <label>Expiry Date</label>
        <input type="text"
               name="expiry"
               placeholder="MM/YY">

        <label>CVV</label>
        <input type="password"
               name="cvv"
               placeholder="XXX">
    </div>
</div>

                <div class="payment-option">
    <input type="radio" name="payment" value="NetBanking"
           onclick="showPaymentFields('netbanking')">
    Net Banking

    <div id="netBankingFields" style="display:none; margin-top:12px;">
        <label>Select Bank</label>

        <select name="bank">
            <option value="">-- Select Bank --</option>
            <option value="SBI">State Bank of India</option>
            <option value="HDFC">HDFC Bank</option>
            <option value="ICICI">ICICI Bank</option>
            <option value="IndianBank">Indian Bank</option>
            <option value="Canara">Canara Bank</option>
        </select>
    </div>
</div>

                <div class="payment-option">
    <input type="radio" name="payment" value="QR"
           onclick="showPaymentFields('qr')">
    QR Code

    <div id="qrFields" style="display:none; margin-top:12px;">
        <p><strong>Scan & Pay</strong></p>
        <p style="margin-top:8px;">
            Demo QR Payment
        </p>

       <div style="text-align:center; margin:15px 0;">
    <img src="image/demo-qr.png"
         alt="Sanjeev Mart Demo QR"
         style="width:180px; height:180px; border-radius:10px;">
</div>  

        <p style="text-align:center;">
           Demo QR - For Project Testing Only
        </p>
    </div>
</div>
                <button class="place-order" type="submit">
                    Place Order
                </button>
            </div>

        </div>

    </form>

    <a class="back" href="cart.jsp">
        ← Back to Cart
    </a>

</div>
<script>
function showPaymentFields(type) {

    const upiFields = document.getElementById("upiFields");
    const cardFields = document.getElementById("cardFields");
    const netBankingFields = document.getElementById("netBankingFields");
    const qrFields = document.getElementById("qrFields");

    // Hide all payment details first
    if (upiFields) {
        upiFields.style.display = "none";
    }

    if (cardFields) {
        cardFields.style.display = "none";
    }

    if (netBankingFields) {
        netBankingFields.style.display = "none";
    }

    if (qrFields) {
        qrFields.style.display = "none";
    }

    // Show selected payment details
    if (type === "upi" && upiFields) {
        upiFields.style.display = "block";
    }

    if (type === "card" && cardFields) {
        cardFields.style.display = "block";
    }

    if (type === "netbanking" && netBankingFields) {
        netBankingFields.style.display = "block";
    }

    if (type === "qr" && qrFields) {
        qrFields.style.display = "block";
    }
}
</script>
</body>
</html>