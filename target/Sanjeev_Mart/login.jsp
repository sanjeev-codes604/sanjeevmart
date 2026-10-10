<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sanjeev Mart</title>

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
            padding: 20px;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: 18px;
            padding: 40px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        .brand {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            color: #131921;
            margin-bottom: 8px;
        }

        .brand span {
            color: #ffb703;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #334155;
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

        .login-btn {
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

        .login-btn:hover {
            background: #f59e0b;
        }

        .register-text {
            text-align: center;
            margin-top: 24px;
            color: #64748b;
            font-size: 14px;
        }

        .register-text a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        .secure-text {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #94a3b8;
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="brand">
        Sanjeev <span>Mart</span>
    </div>

    <p class="subtitle">
        Sign in to continue shopping
    </p>

    <form action="login" method="post">

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
                placeholder="Enter your password"
                required>
        </div>

        <button class="login-btn" type="submit">
            Login
        </button>

    </form>

    <p class="register-text">
        Don't have an account?
        <a href="register.jsp">Create Account</a>
    </p>

    <p class="secure-text">
        Secure Login | Sanjeev Mart
    </p>

</div>

</body>
</html>