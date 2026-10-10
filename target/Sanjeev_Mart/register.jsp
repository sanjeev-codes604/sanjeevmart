<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - Sanjeev Mart</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #131921, #334155);
            padding: 30px 20px;
        }

        .register-container {
            width: 100%;
            max-width: 460px;
            background: white;
            padding: 38px;
            border-radius: 18px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        .brand {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            color: #131921;
            margin-bottom: 7px;
        }

        .brand span {
            color: #ffb703;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 28px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #334155;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
        }

        input:focus {
            border-color: #ffb703;
            box-shadow: 0 0 0 3px rgba(255,183,3,0.15);
        }

        .register-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #ffb703;
            color: #131921;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        .register-btn:hover {
            background: #f59e0b;
        }

        .login-text {
            text-align: center;
            margin-top: 22px;
            color: #64748b;
            font-size: 14px;
        }

        .login-text a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .login-text a:hover {
            text-decoration: underline;
        }

        .secure-text {
            text-align: center;
            margin-top: 18px;
            color: #94a3b8;
            font-size: 12px;
        }
    </style>
</head>

<body>

<div class="register-container">

    <div class="brand">
        Sanjeev <span>Mart</span>
    </div>

    <p class="subtitle">
        Create your account and start shopping
    </p>

    <form action="register" method="post">

        <div class="form-group">
            <label>Full Name</label>
            <input
                type="text"
                name="name"
                placeholder="Enter your full name"
                required>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input
                type="password"
                name="password"
                placeholder="Create a password"
                required>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input
                type="tel"
                name="phone"
                placeholder="Enter your phone number"
                required>
        </div>

        <button class="register-btn" type="submit">
            Create Account
        </button>

    </form>

    <p class="login-text">
        Already have an account?
        <a href="login.jsp">Login</a>
    </p>

    <p class="secure-text">
        Secure Registration | Sanjeev Mart
    </p>

</div>

</body>
</html>