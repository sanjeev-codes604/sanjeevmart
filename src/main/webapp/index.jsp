<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sanjeev Mart</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: #f5f7fa;
        }

        /* NAVBAR */
        .navbar {
            background: #131921;
            color: white;
            padding: 16px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 27px;
            font-weight: bold;
        }

        .logo span {
            color: #ffb703;
        }

        .nav-buttons a {
            text-decoration: none;
            margin-left: 12px;
            padding: 10px 18px;
            border-radius: 7px;
            font-weight: bold;
        }

        .login-btn {
            color: white;
            border: 1px solid #ffb703;
        }

        .register-btn {
            background: #ffb703;
            color: #131921;
        }

        /* HERO */
        .hero {
            min-height: calc(100vh - 70px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 8%;
            background: linear-gradient(135deg, #131921, #334155);
            color: white;
        }

        .hero-content {
            max-width: 620px;
        }

        .tag {
            display: inline-block;
            background: rgba(255,183,3,0.15);
            color: #ffb703;
            padding: 8px 14px;
            border-radius: 20px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .hero h1 {
            font-size: 52px;
            line-height: 1.15;
            margin-bottom: 18px;
        }

        .hero h1 span {
            color: #ffb703;
        }

        .hero p {
            font-size: 19px;
            color: #d1d5db;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
        }

        .hero-buttons a {
            text-decoration: none;
            padding: 14px 25px;
            border-radius: 8px;
            font-weight: bold;
        }

        .start-btn {
            background: #ffb703;
            color: #131921;
        }

        .signin-btn {
            border: 1px solid white;
            color: white;
        }

        /* RIGHT SIDE */
        .shopping-card {
            width: 350px;
            background: white;
            color: #1f2937;
            border-radius: 22px;
            padding: 35px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        .shopping-icon {
            font-size: 85px;
            margin-bottom: 20px;
        }

        .shopping-card h2 {
            margin-bottom: 10px;
        }

        .shopping-card p {
            color: #64748b;
            font-size: 15px;
            margin-bottom: 0;
        }

        .features {
            margin-top: 25px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .feature {
            background: #f5f7fa;
            padding: 12px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
        }

        @media (max-width: 850px) {
            .hero {
                flex-direction: column;
                text-align: center;
                gap: 45px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .hero-buttons {
                justify-content: center;
            }

            .shopping-card {
                width: 100%;
                max-width: 350px;
            }
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        Sanjeev <span>Mart</span>
    </div>

    <div class="nav-buttons">

        <a class="login-btn"
           href="login.jsp">
            Login
        </a>

        <a class="register-btn"
           href="register.jsp">
            Register
        </a>

    </div>

</div>


<section class="hero">

    <div class="hero-content">

        <div class="tag">
            🛒 Online Shopping Made Simple
        </div>

        <h1>
            Welcome to
            <span>Sanjeev Mart</span>
        </h1>

        <p>
            Your online shopping destination for electronics
            and everyday products. Browse products, add them
            to your cart and shop easily.
        </p>

        <div class="hero-buttons">

            <a class="start-btn"
               href="register.jsp">
                Get Started
            </a>

            <a class="signin-btn"
               href="login.jsp">
                Login
            </a>

        </div>

    </div>


    <div class="shopping-card">

        <div class="shopping-icon">
            🛍️
        </div>

        <h2>Sanjeev Mart</h2>

        <p>
            Simple • Fast • Convenient Shopping
        </p>

        <div class="features">

            <div class="feature">
                📦 Products
            </div>

            <div class="feature">
                🛒 Easy Cart
            </div>

            <div class="feature">
                📋 Orders
            </div>

            <div class="feature">
                🔒 Secure Login
            </div>

        </div>

    </div>

</section>

</body>
</html>