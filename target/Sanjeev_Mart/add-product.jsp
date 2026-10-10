<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - Sanjeev Mart</title>

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
            max-width: 700px;
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

        .form-card {
            background: white;
            padding: 32px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #334155;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        input:focus,
        textarea:focus {
            border-color: #ffb703;
            box-shadow: 0 0 0 3px rgba(255,183,3,0.15);
        }

        .row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .add-btn {
            width: 100%;
            border: none;
            background: #ffb703;
            color: #131921;
            padding: 14px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-btn:hover {
            background: #f59e0b;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 600px) {
            .row {
                grid-template-columns: 1fr;
                gap: 0;
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
        <a href="products">Products</a>
        <a href="home.jsp">Store</a>
    </div>

</div>


<div class="container">

    <h1 class="page-title">Add New Product</h1>

    <p class="subtitle">
        Add a new product to the Sanjeev Mart catalogue.
    </p>


    <div class="form-card">

        <form action="add-product" method="post">

            <div class="form-group">
                <label>Product Name</label>
                <input
                    type="text"
                    name="name"
                    placeholder="Enter product name"
                    required>
            </div>


            <div class="form-group">
                <label>Description</label>
                <textarea
                    name="description"
                    placeholder="Enter product description"
                    required></textarea>
            </div>


            <div class="row">

                <div class="form-group">
                    <label>Price (Rs.)</label>
                    <input
                        type="number"
                        name="price"
                        step="0.01"
                        min="0"
                        placeholder="0.00"
                        required>
                </div>


                <div class="form-group">
                    <label>Stock</label>
                    <input
                        type="number"
                        name="stock"
                        min="0"
                        placeholder="Available quantity"
                        required>
                </div>

            </div>


            <div class="form-group">
                <label>Category</label>
                <input
                    type="text"
                    name="category"
                    placeholder="Example: Electronics"
                    required>
            </div>


            <div class="form-group">
                <label>Image URL</label>
                <input
                    type="text"
                    name="imageUrl"
                    placeholder="Enter product image URL (optional)">
            </div>


            <button class="add-btn" type="submit">
                + Add Product
            </button>

        </form>

    </div>


    <a class="back-btn" href="seller-dashboard">
        ← Back to Seller Dashboard
    </a>

</div>

</body>
</html>