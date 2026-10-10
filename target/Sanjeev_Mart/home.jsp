<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Sanjeev Mart</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f7fa;
            color: #222;
        }

        /* NAVBAR */
        .navbar {
            background: #131921;
            color: white;
            padding: 15px 6%;
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

        .nav-links {
            display: flex;
            gap: 22px;
            align-items: center;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #ffb703;
        }

        /* HERO */
        .hero {
            background: linear-gradient(135deg, #1f2937, #334155);
            color: white;
            padding: 55px 6%;
        }

        .hero h1 {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .hero p {
            color: #d1d5db;
            font-size: 17px;
        }

        /* PRODUCTS */
        .container {
            width: 88%;
            margin: 40px auto;
        }

        .section-title {
            font-size: 27px;
            margin-bottom: 25px;
        }
        .search-box {
    display: flex;
    gap: 15px;
    margin-bottom: 30px;
}

.search-box input {
    flex: 1;
    padding: 13px 16px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
}

.search-box input:focus {
    border-color: #ffb703;
}

.search-box select {
    width: 210px;
    padding: 13px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    background: white;
    font-size: 15px;
    cursor: pointer;
}

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 25px;
        }

        .product-card {
            background: white;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.13);
        }

        .product-icon {
            height: 150px;
            background: #eef2f7;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 65px;
            margin-bottom: 20px;
        }

        .product-card h3 {
            font-size: 21px;
            margin-bottom: 10px;
        }

        .price {
            font-size: 19px;
            font-weight: bold;
            margin-bottom: 18px;
            color: #1f2937;
        }

        .cart-btn {
            width: 100%;
            border: none;
            background: #ffb703;
            padding: 12px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .cart-btn:hover {
            background: #f59e0b;
        }
/* FLOATING AI CHAT BUTTON */
.floating-chat {
    position: fixed;
    right: 25px;
    bottom: 25px;
    width: 60px;
    height: 60px;
    background: #ffb703;
    color: #131921;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 30px;
    text-decoration: none;
    box-shadow: 0 5px 18px rgba(0,0,0,0.25);
    z-index: 1000;
    transition: 0.3s;
}

.floating-chat:hover {
    transform: scale(1.1);
    background: #f59e0b;
}
        /* FOOTER */
        footer {
            margin-top: 60px;
            background: #131921;
            color: #ccc;
            text-align: center;
            padding: 22px;
        }

        @media (max-width: 700px) {
            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                gap: 12px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .hero h1 {
                font-size: 29px;
            }
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="order-history">My Orders</a>
        <a href="seller-dashboard">Seller Dashboard</a>
        <a href="chatbot.jsp">&#129302; AI Assistant</a>   
        <a href="logout">Logout</a>
    </div>

</div>


<!-- HERO -->
<div class="hero">
    <h1>Welcome to Sanjeev Mart</h1>
    <p>Everything you need, all in one place.</p>
</div>


<!-- PRODUCTS -->
<div class="container">

    <h2 class="section-title">Featured Products</h2>
    <div class="search-box">
    <input
        type="text"
        id="searchInput"
        placeholder="Search products..."
        onkeyup="filterProducts()">

    <select id="categoryFilter" onchange="filterProducts()">
        <option value="all">All Categories</option>
        <option value="computer">Computer</option>
        <option value="mobile">Mobile</option>
        <option value="accessories">Accessories</option>
        <option value="electronics">Electronics</option>
    </select>
</div>
    <div class="products">

        <!-- LAPTOP -->
       
<div class="product-card" data-category="computer">

            <div class="product-icon">
                &#128187;
            </div>

            <h3>Laptop</h3>

            <p class="price">Rs. 50,000</p>

            <form action="cart" method="post">
                <input type="hidden" name="product" value="Laptop">
                <button class="cart-btn" type="submit">
                    Add to Cart
                </button>
            </form>

        </div>


        <!-- SMARTPHONE -->
       
<div class="product-card" data-category="mobile">

            <div class="product-icon">
                &#128241;
            </div>

            <h3>Smartphone</h3>

            <p class="price">Rs. 20,000</p>

            <form action="cart" method="post">
                <input type="hidden" name="product" value="Smartphone">
                <button class="cart-btn" type="submit">
                    Add to Cart
                </button>
            </form>

        </div>


        <!-- HEADPHONES -->
       <div class="product-card" data-category="accessories">

            <div class="product-icon">
                &#127911;
            </div>

            <h3>Headphones</h3>

            <p class="price">Rs. 2,000</p>

            <form action="cart" method="post">
                <input type="hidden" name="product" value="Headphones">
                <button class="cart-btn" type="submit">
                    Add to Cart
                </button>
            </form>

        </div>
<!-- SMART WATCH -->
<div class="product-card" data-category="electronics">
    <div class="product-icon">⌚</div>
    <h3>Smart Watch</h3>
    <p class="price">Rs. 4,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Smart Watch">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- TABLET -->
<div class="product-card" data-category="mobile">
    <div class="product-icon">📱</div>
    <h3>Tablet</h3>
    <p class="price">Rs. 18,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Tablet">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- KEYBOARD -->
<div class="product-card" data-category="computer">
    <div class="product-icon">⌨️</div>
    <h3>Keyboard</h3>
    <p class="price">Rs. 1,499</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Keyboard">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- MOUSE -->
<div class="product-card" data-category="accessories">
    <div class="product-icon">🖱️</div>
    <h3>Wireless Mouse</h3>
    <p class="price">Rs. 799</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Wireless Mouse">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- BLUETOOTH SPEAKER -->
<div class="product-card" data-category="electronics">
    <div class="product-icon">🔊</div>
    <h3>Bluetooth Speaker</h3>
    <p class="price">Rs. 2,499</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Bluetooth Speaker">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- POWER BANK -->
<div class="product-card" data-category="electronics"></div>
    <div class="product-icon">🔋</div>
    <h3>Power Bank</h3>
    <p class="price">Rs. 1,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Power Bank">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- MONITOR -->
<div class="product-card" data-category="computer">
    <div class="product-icon">🖥️</div>
    <h3>Monitor</h3>
    <p class="price">Rs. 12,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Monitor">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- GAMING CONTROLLER -->
<div class="product-card" data-category="accessories">
    <div class="product-icon">🎮</div>
    <h3>Gaming Controller</h3>
    <p class="price">Rs. 2,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Gaming Controller">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- CAMERA -->
<div class="product-card" data-category="electronics">
    <div class="product-icon">📷</div>
    <h3>Digital Camera</h3>
    <p class="price">Rs. 24,999</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Digital Camera">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>

<!-- BACKPACK -->
<div class="product-card" data-category="accessories">
    <div class="product-icon">🎒</div>
    <h3>Laptop Backpack</h3>
    <p class="price">Rs. 1,299</p>
    <form action="cart" method="post">
        <input type="hidden" name="product" value="Laptop Backpack">
        <button class="cart-btn" type="submit">Add to Cart</button>
    </form>
</div>
    </div>

</div>
<a href="chatbot.jsp" class="floating-chat" title="Sanjeev Mart AI Assistant">
    🤖
</a>
<footer>
    &copy; 2026 Sanjeev Mart | Java Web Application
</footer>
<script>

function filterProducts() {

    const searchValue =
        document.getElementById("searchInput").value.toLowerCase();

    const selectedCategory =
        document.getElementById("categoryFilter").value;

    const products =
        document.querySelectorAll(".product-card");

    products.forEach(function(product) {

        const productName =
            product.querySelector("h3").innerText.toLowerCase();

        const productCategory =
            product.getAttribute("data-category");

        const matchesSearch =
            productName.includes(searchValue);

        const matchesCategory =
            selectedCategory === "all" ||
            productCategory === selectedCategory;

        if (matchesSearch && matchesCategory) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }
    });
}
</script>
</body>
</html>