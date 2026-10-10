<%@ page import="com.sanjeevmart.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - Sanjeev Mart</title>

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
            margin-bottom: 8px;
            font-weight: bold;
            color: #334155;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
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

        .update-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #ffb703;
            color: #131921;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .update-btn:hover {
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

    <h1 class="page-title">Edit Product</h1>

    <p class="subtitle">
        Update the product information below.
    </p>


    <div class="form-card">

        <form action="edit-product" method="post">

            <input
                type="hidden"
                name="id"
                value="<%= product.getId() %>">


            <div class="form-group">
                <label>Product Name</label>

                <input
                    type="text"
                    name="name"
                    value="<%= product.getName() %>"
                    required>
            </div>


            <div class="form-group">
                <label>Description</label>

                <textarea
                    name="description"
                    required><%= product.getDescription() %></textarea>
            </div>


            <div class="row">

                <div class="form-group">
                    <label>Price (Rs.)</label>

                    <input
                        type="number"
                        name="price"
                        step="0.01"
                        min="0"
                        value="<%= product.getPrice() %>"
                        required>
                </div>


                <div class="form-group">
                    <label>Stock</label>

                    <input
                        type="number"
                        name="stock"
                        min="0"
                        value="<%= product.getStock() %>"
                        required>
                </div>

            </div>


            <div class="form-group">
                <label>Category</label>

                <input
                    type="text"
                    name="category"
                    value="<%= product.getCategory() %>"
                    required>
            </div>


            <div class="form-group">
                <label>Image URL</label>

                <input
                    type="text"
                    name="imageUrl"
                    value="<%= product.getImageUrl() %>">
            </div>


            <button class="update-btn" type="submit">
                Update Product
            </button>

        </form>

    </div>


    <a class="back-btn" href="products">
        ← Back to Products
    </a>

</div>

</body>
</html>