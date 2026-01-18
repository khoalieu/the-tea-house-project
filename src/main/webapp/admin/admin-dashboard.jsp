<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Blog - Mộc Trà Admin</title>
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/components.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/admin-add-product.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <jsp:include page="/common/admin-sidebar.jsp">
        <jsp:param name="activePage" value="dashboard" />
    </jsp:include>


    <main class="admin-main">
        <header class="admin-header">
            <div class="header-left">
                <h1>Dashboard</h1>
            </div>

            <div class="header-right">
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Tìm kiếm...">
                </div>

                <button class="notification-btn">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </button>

                <a href="../index.jsp" class="view-site-btn" target="_blank">
                    <i class="fas fa-external-link-alt"></i>
                    <span>Xem trang web</span>
                </a>
            </div>
        </header>

        <div class="admin-content">
            <div class="admin-widgets">
                <div class="widget">
                    <div class="widget-header">
                        <h3>Đơn hàng gần đây</h3>
                        <a href="orders.html" class="widget-link">Xem tất cả</a>
                    </div>
                    <div class="widget-content">
                        <div class="item-list">
                            <div class="list-item">
                                <div class="item-info">
                                    <div class="item-title">#DH001</div>
                                    <div class="item-subtitle">Nguyễn Văn A</div>
                                </div>
                                <div class="item-details">
                                    <div class="item-amount">245,000₫</div>
                                    <div class="status-badge status-pending">Chờ xử lý</div>
                                </div>
                            </div>

                            <div class="list-item">
                                <div class="item-info">
                                    <div class="item-title">#DH002</div>
                                    <div class="item-subtitle">Trần Thị B</div>
                                </div>
                                <div class="item-details">
                                    <div class="item-amount">180,000₫</div>
                                    <div class="status-badge status-delivered">Đã hoàn tất</div>
                                </div>
                            </div>

                            <div class="list-item">
                                <div class="item-info">
                                    <div class="item-title">#DH003</div>
                                    <div class="item-subtitle">Lê Văn C</div>
                                </div>
                                <div class="item-details">
                                    <div class="item-amount">320,000₫</div>
                                    <div class="status-badge status-delivered">Đã hoàn tất</div>
                                </div>
                            </div>

                            <div class="list-item">
                                <div class="item-info">
                                    <div class="item-title">#DH004</div>
                                    <div class="item-subtitle">Phạm Thị D</div>
                                </div>
                                <div class="item-details">
                                    <div class="item-amount">150,000₫</div>
                                    <div class="status-badge status-pending">Chờ xử lý</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="quick-actions">
                <h3>Thao tác nhanh</h3>
                <div class="actions-grid">
                    <a href="admin-products-add.html" class="action-card">
                        <i class="fas fa-plus"></i>
                        <span>Thêm sản phẩm mới</span>
                    </a>

                    <a href="admin-orders.jsp" class="action-card">
                        <i class="fas fa-list-alt"></i>
                        <span>Xem đơn hàng</span>
                    </a>

                    <a href="admin-customers.jsp" class="action-card">
                        <i class="fas fa-user-plus"></i>
                        <span>Quản lý khách hàng</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/blog/add" class="action-card">
                        <i class="fas fa-pen"></i>
                        <span>Viết bài blog</span>
                    </a>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>