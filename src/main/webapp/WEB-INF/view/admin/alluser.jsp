<%@ page contentType="text/html" pageEncoding="UTF-8" %>




    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="ShyShop - Quản trị hệ thống">
        <title>ShyShop - Quản trị</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Roboto', sans-serif;
                background-color: #1a1a1a;
                color: #e0e0e0;
            }

            /* Header */
            header {
                background-color: #2c2c2c;
                padding: 15px 20px;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            }

            .header-container {
                max-width: 1400px;
                margin: 0 auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            header h1 {
                color: #f28c38;
                font-size: 24px;
                font-weight: 700;
            }

            .header-actions a {
                color: #f28c38;
                margin-left: 20px;
                text-decoration: none;
                font-size: 14px;
            }

            .header-actions a:hover {
                color: #ff9f38;
            }

            /* Admin Container */
            .admin-container {
                display: flex;
                margin-top: 70px;
            }

            /* Sidebar */
            .sidebar {
                width: 250px;
                background: #252525;
                padding: 20px;
                position: fixed;
                height: calc(100vh - 70px);
                overflow-y: auto;
                border-right: 1px solid #333;
            }

            .sidebar h3 {
                font-size: 18px;
                color: #f28c38;
                margin-bottom: 20px;
                font-weight: 700;
            }

            .sidebar a {
                display: block;
                color: #b0b0b0;
                text-decoration: none;
                margin-bottom: 15px;
            }

            .sidebar a:hover {
                color: #f28c38;
            }

            /* Admin Content */
            .admin-content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
            }

            .card {
                background: #252525;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            }

            .card-header {
                font-size: 20px;
                color: #f28c38;
                margin-bottom: 10px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            table,
            th,
            td {
                border: 1px solid #333;
            }

            th,
            td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #2c2c2c;
            }

            tr:nth-child(even) {
                background-color: #333;
            }

            tr:hover {
                background-color: #444;
            }

            .btn {
                padding: 8px 16px;
                background-color: #f28c38;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #e07b30;
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <header>
            <div class="header-container">
                <h1>ShyShop - Admin</h1>
                <div class="header-actions">
                    <a href="#">Đăng xuất</a>
                </div>
            </div>
        </header>

        <!-- Admin Content -->
        <div class="admin-container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <h3>Menu Quản trị</h3>
                <a href="#">Tổng quan</a>
                <a href="#">Quản lý sản phẩm</a>
                <a href="#">Quản lý đơn hàng</a>
                <a href="admin/showuser">Quản lý người dùng</a>
            </aside>

            <!-- Admin Main Content -->
            <div class="admin-content">

                <!-- User Management -->
                <div class="card">
                    <div class="card-header">Quản lý Người dùng</div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <!-- Use 'user' instead of 'users' -->
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <!-- Nút Xem -->
                                        <a href="/admin/user/show/${user.id}" class="btn btn-update">Xem</a>

                                        <!-- Nút Cập nhật -->
                                        <a href="/admin/user/update/${user.id}" class="btn btn-update">Cập Nhật</a>

                                        <!-- Nút Xóa -->
                                        <form action="<c:url value='/admin/user/delete/${user.id}' />" method="POST"
                                            class="delete-form">
                                            <button type="submit" class="btn btn-delete">Xóa Người Dùng</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </body>

    </html>